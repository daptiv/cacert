# cacert

Chef cookbook that downloads and updates a cacert.pem file and sets the SSL_CERT_FILE environment variable.

## Requirements

### Platform
* Linux
* Windows

## Updating

The cacert.pem file contains a list of public root CA certificates.  It is used by the OpenSSL library to validate SSL connections.  The file must be kept up to date in order to ensure communication is possible with all public secure sites.

New versions of cacert.pem can be obtained from the [official curl homepage](https://curl.haxx.se/docs/caextract.html).  The curl maintainers ask that their site not be used as a primary download server.  As such, we mirror date stamped copies of cacert.pem in the [cacert-local repo](http://artrepo.daptiv.com/artifactory/webapp/#/artifacts/browse/tree/General/cacert-local) in Artifactory.

To update the cacert.pem file installed by this cookbook:
* Download the latest date stamped cacert.pem file (ex. `cacert-2018-12-05.pem`) from the [official curl homepage](https://curl.haxx.se/docs/caextract.html).
* Upload it to the [cacert-local repo](http://artrepo.daptiv.com/artifactory/webapp/#/artifacts/browse/tree/General/cacert-local) in Artifactory.
* Update `default['cacert']['pem_url']` in [attributes/default.rb](attributes/default.rb).
* Ensure the cookbook's [TeamCity build](http://teamcity.daptiv.com/viewType.html?buildTypeId=Chef_Cookbooks_Cacert) passes.

## Contributing

1. Fork the repository on GitHub.
2. Create a named feature branch. (i.e. `add-new-module`)
3. Write your change.
4. Write tests for your change, if applicable.
5. Run the tests, ensuring they all pass.
6. Submit a pull request.

## License and Authors

Author:: Changepoint Engineering (cpc_sea_teamengineering@changepoint.com)
