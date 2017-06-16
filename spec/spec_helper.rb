require 'chefspec'
require 'chefspec/berkshelf'

shared_context 'Ubuntu 16.04' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe)
  end
end
