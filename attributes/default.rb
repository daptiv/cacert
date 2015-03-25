#:encoding utf-8
default['cacert']['pem_url'] = 'http://curl.haxx.se/ca/cacert.pem'
default['cacert']['install_path'] = Chef::Config[:file_cache_path]
