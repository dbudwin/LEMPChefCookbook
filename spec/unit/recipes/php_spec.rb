require 'spec_helper'

describe 'LEMPChefCookbook::php' do
  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'restarts php7.0-fpm service' do
      expect(chef_run).to restart_service('php7.0-fpm')
    end
  end
end
