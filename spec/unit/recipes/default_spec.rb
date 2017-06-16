require 'spec_helper'

describe 'LEMPChefCookbook::default' do
  include_context 'Ubuntu 16.04'

  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'secrets').and_return('mysql_password' => 'password')
    stub_command("php -m | grep 'Phar'").and_return('Phar')
  end

  it 'includes composer::default recipe to install Composer' do
    expect(chef_run).to include_recipe('composer::default')
  end
end
