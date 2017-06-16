require 'spec_helper'

describe 'LEMPChefCookbook::nginx' do
  include_context 'Ubuntu 16.04'

  it 'includes chef_nginx::default recipe to install Chef\'s NGINX' do
    expect(chef_run).to include_recipe('chef_nginx::default')
  end

  it 'nginx service is running' do
    expect(chef_run).to start_service('nginx')
  end
end
