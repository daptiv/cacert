#
# Author:: Changepoint Engineering (<cpc_sea_teamengineering@changepoint.com>)
# Cookbook Name:: cacert
# Recipe:: default
#
# Copyright (c) 2018 Changepoint
#
# All rights reserved - Do Not Redistribute
#

if platform?('windows')
  remote_file "#{node['cacert']['install_path']}\\cacert.pem" do
    source node['cacert']['pem_url']
  end

  env 'SSL_CERT_FILE' do
    value "#{node['cacert']['install_path']}\\cacert.pem"
  end
end
