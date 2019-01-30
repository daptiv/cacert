#:encoding utf-8
default['cacert']['pem_url'] =
  'http://artrepo.daptiv.com/artifactory/simple/cacert-local/' \
  'cacert-2018-12-05.pem'
default['cacert']['linux']['install_path'] = '/etc/chef'
default['cacert']['windows']['install_path'] = 'c:\\chef'
