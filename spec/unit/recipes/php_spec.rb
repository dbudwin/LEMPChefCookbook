require 'spec_helper'

describe 'LEMPChefCookbook::php' do
  include_context 'Ubuntu 16.04'

  it 'includes php::default recipe to install PHP' do
    expect(chef_run).to include_recipe('php::default')
  end

  it 'restarts php7.0-fpm service' do
    expect(chef_run).to restart_service('php7.0-fpm')
  end
end
