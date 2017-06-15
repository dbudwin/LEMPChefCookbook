require 'spec_helper'

describe 'LEMPChefCookbook::default' do
  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'secrets').and_return('mysql_password' => 'password')
  end

  context 'When all attributes are default, on an Ubuntu 16.04' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end
