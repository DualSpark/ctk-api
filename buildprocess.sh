#!/bin/bash
while read -r line
do
    if [[ $line = *amazon-ebs,artifact,0,id* ]]
    then
        echo "${line##*,}" | sed 's/%!(PACKER_COMMA)/,/g' | tee -a imagedetails.txt
    fi
done < "imagebuild.output.txt"


#!/bin/bash
line=$(grep 'amazon-ebs,artifact,0,id' imagebuild.output.txt)
image_details=`echo "${line##*,}" | sed 's/%!(PACKER_COMMA)/,/g'`
aws dynamodb put-item --table-name ctk-api-deploydata --item '{"tier_name":{"S":"'$1'"},"timestamp":{"N":'$(date +"%s")'}, "image_details": {"S": "'$image_details'"}}'
