#
# Author:: Daptiv Engineering (<cpc_sea_teamengineering@changepoint.com>)
# Cookbook Name:: cacert
# Spec:: default
#
# Copyright (c) 2018 Changepoint
#
# All rights reserved - Do Not Redistribute
#

require 'spec_helper'

describe 'cacert::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end
    it 'converges successfully' do
      chef_run # This should not raise an error
    end
  end
end
