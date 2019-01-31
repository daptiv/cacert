# encoding: UTF-8

require 'minitest/spec'

# The Install tests
# rubocop:disable BlockLength
class CacertInstallTest < MiniTest::Chef::Spec
  describe 'cacert::default' do
    it 'ensure_pem_file_exists' do
      case node['platform']
      when 'linux'
        assert File.exist?(
          "#{node['cacert']['linux']['install_path']}/cacert.pem"
        )
      when 'windows'
        assert File.exist?(
          "#{node['cacert']['windows']['install_path']}\\cacert.pem"
        )
      end
    end

    it 'ensures SSL_CERT_FILE environment variable is in registry' do
      case node['platform']
      when 'linux'
        cert_file_path = "#{node['cacert']['linux']['install_path']}/cacert.pem"
        assert(
          File.foreach('/etc/environment').grep(
            /SSL_CERT_FILE=#{cert_file_path}/
          ).any?
        )
      when 'windows'
        require 'win32/registry'
        path = 'SYSTEM\\CurrentControlSet\\Control\\' \
          'Session Manager\\Environment'
        key = 'SSL_CERT_FILE'
        reg_type = Win32::Registry::KEY_READ | 0x100
        Win32::Registry::HKEY_LOCAL_MACHINE.open(path, reg_type) do |reg|
          assert_equal(
            "#{node['cacert']['windows']['install_path']}\\cacert.pem",
            reg[key],
            'SSL_CERT_FILE environment variable missing or incorrect'
          )
        end
      end
    end
  end
end
# rubocop:enable BlockLength
