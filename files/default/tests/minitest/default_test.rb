#:encoding utf-8
require 'minitest/spec'

# Defines Install Tests
class CacertInstallTest < MiniTest::Chef::TestCase
  def test_pem_file_exists
    assert File.exist?("#{node['cacert']['install_path']}/cacert.pem")
  end

  def test_env_var_exists
    msg = "ENV['SSL_CERT_FILE'] missing or incorrect"
    assert_equal(
      "#{node['cacert']['install_path']}\\cacert.pem",
      ENV['SSL_CERT_FILE'],
      msg)
  end
end
