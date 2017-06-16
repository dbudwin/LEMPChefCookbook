require 'spec_helper'

describe 'LEMPChefCookbook::mysql' do
  include_context 'Ubuntu 16.04'

  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'secrets').and_return('mysql_password' => 'password')
  end

  it 'MySQL RoboHome service is running' do
    expect(chef_run).to start_mysql_service('robohome')
  end
end
