#:encoding utf-8
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:each) do
    # Set some common global ENV vars used by Windows cookbooks
    ENV['WINDIR'] = 'C:\Windows'
    stub_const('File::ALT_SEPARATOR', '\\')

    # Stub sensisble default return value for registry access
    allow_any_instance_of(Chef::Recipe).to receive(
      :registry_key_exists?
    ).and_return(false)

    stub_command('grep SSL_CERT_FILE /etc/environment').and_return(false)
  end
end
