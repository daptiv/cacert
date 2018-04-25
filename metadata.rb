name 'cacert'
maintainer 'Changepoint'
maintainer_email 'cpc_sea_teamengineering@changepoint.com'
license 'All rights reserved'
description 'Installs/Configures cacert'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
ver_path = File.join(File.dirname(__FILE__), 'version.txt')
version File.exist?(ver_path) ? IO.read(ver_path).chomp : '0.2.1'
chef_version '>= 12.5' if respond_to?(:chef_version)
issues_url 'https://github.com/daptiv/daptiv_sso/issues'
source_url 'https://github.com/daptiv/daptiv_sso/'
supports 'ubuntu'
supports 'windows'
