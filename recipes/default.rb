#
# Cookbook Name:: ctk-api
# Recipe:: install
#
# installs python, pip and supervisor to run a flask-restful microservice.
# as a base requirement, also installs build-essentials as psutil package needs to be compiled
#
#

# fix for installing python from source... force apt-get update via inclusion of apt recipe
# needed bc we are pulling build-essential in for the psutil package
if node["platform_family"] == "debian"
    node.override['apt']['compile_time_update'] = true
    include_recipe 'apt'
end

# build-essential for psutil python package
node.override['build-essential']['compile_time'] = true
include_recipe "build-essential"

# https://supermarket.chef.io/cookbooks/python
include_recipe 'python'
include_recipe 'python::pip'

# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

# install package
python_pip "#{node['ctk-api']['package_location']}"

# set up supervisor configuration for api
supervisor_service 'ctk-api' do
    service_name 'ctk-api'
    command "episode_api --single_uri_base #{node['ctk-api']['single_uri_base']} --list_uri_base #{node['ctk-api']['list_uri_base']} --healthcheck_base #{node['ctk-api']['healthcheck_base']}"
    action :enable
    autostart true
    user 'nobody'
    stderr_logfile '/var/log/ctk-api.stderr.log'
    stdout_logfile '/var/log/ctk-api.stdout.log'
end
