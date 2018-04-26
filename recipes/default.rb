#
# Author:: Daptiv Engineering (<cpc_sea_teamengineering@changepoint.com>)
# Cookbook Name:: cacert
# Recipe:: default
#
# Copyright (c) 2018 Changepoint
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node['cacert']['install_path']}/cacert.pem" do
  source node['cacert']['pem_url']
end

if platform?('windows')
  env 'SSL_CERT_FILE' do
    value "#{node['cacert']['install_path']}\\cacert.pem"
  end
else
  # add unix env var here
  puts 'Adding SSL_CERT_FILE enviroment variable.'
end
