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
  cert_file_path = "#{node['cacert']['windows']['install_path']}\\cacert.pem"

  directory 'cacert installation directory' do
    path node['cacert']['windows']['install_path']
    action :create
  end

  remote_file 'cacert file' do
    path cert_file_path
    source node['cacert']['pem_url']
  end

  env 'SSL_CERT_FILE' do
    value cert_file_path
  end
else
  cert_file_path = "#{node['cacert']['linux']['install_path']}/cacert.pem"

  directory 'cacert installation directory' do
    path node['cacert']['linux']['install_path']
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end

  remote_file 'cacert file' do
    path cert_file_path
    source node['cacert']['pem_url']
  end

  ruby_block 'edit /etc/environment' do
    block do
      line = "SSL_CERT_FILE=#{cert_file_path}"
      File.open('/etc/environment', 'a') { |f| f.write(line) }
    end
    not_if 'grep SSL_CERT_FILE /etc/environment'
  end
end
