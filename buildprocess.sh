#!/bin/bash
line=$(grep 'amazon-ebs,artifact,0,id' imagebuild.output.txt)
image_details=`echo "${line##*,}" | sed 's/%!(PACKER_COMMA)/,/g'`
aws dynamodb put-item --table-name ctk-api-deploydata --item '{"tier_name":{"S":"'$1'"},"timestamp":{"N":"'$(date +"%s")'"}, "image_details": {"S": "'$image_details'"}}'
