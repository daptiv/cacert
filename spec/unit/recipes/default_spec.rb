#
# Author:: Changepoint Engineering (<cpc_sea_teamengineering@changepoint.com>)
# Cookbook Name:: cacert
# Spec:: default
#
# Copyright (c) 2018 Changepoint
#
# All rights reserved - Do Not Redistribute
#

require 'spec_helper'

# rubocop:disable BlockLength
describe 'cacert::default' do
  context 'On the Windows platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'windows',
        version: '2012R2'
      )
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates the cacert installation directory' do
      expect(chef_run).to create_directory(
        'cacert installation directory'
      )
    end

    it 'downloads the cacert file' do
      expect(chef_run).to create_remote_file(
        'cacert file'
      )
    end

    it 'sets the SSL_CERT_FILE environment variable' do
      expect(chef_run).to create_env(
        'SSL_CERT_FILE'
      )
    end
  end

  context 'On the Linux platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(
        platform: 'ubuntu',
        version: '18.04'
      )
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates the cacert installation directory' do
      expect(chef_run).to create_directory(
        'cacert installation directory'
      )
    end

    it 'downloads the cacert file' do
      expect(chef_run).to create_remote_file(
        'cacert file'
      )
    end

    it 'sets the SSL_CERT_FILE environment variable' do
      expect(chef_run).to run_ruby_block(
        'edit /etc/environment'
      )
    end
  end
end
# rubocop:enable BlockLength
