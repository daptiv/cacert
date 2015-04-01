# encoding: UTF-8
require 'minitest/spec'

# The Install tests
class CacertInstallTest < MiniTest::Chef::Spec
  describe 'cacert::default' do
    it 'ensure_pem_file_exists' do
      assert File.exist?("#{node['cacert']['install_path']}/cacert.pem")
    end

    it 'ensures SSL_CERT_FILE environment variable is in registry' do
      case node['platform']
      when 'windows'
        require 'win32/registry'
        path = 'SYSTEM\\CurrentControlSet\\Control\\' \
          'Session Manager\\Environment'
        key = 'SSL_CERT_FILE'
        reg_type = Win32::Registry::KEY_READ | 0x100
        Win32::Registry::HKEY_LOCAL_MACHINE.open(path, reg_type) do |reg|
          assert_equal(
            "#{node['cacert']['install_path']}\\cacert.pem",
            reg[key],
            'SSL_CERT_FILE environment variable missing or incorrect')
        end
      end
    end
  end
end
