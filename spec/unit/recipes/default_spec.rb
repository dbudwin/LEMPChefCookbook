require 'spec_helper'

describe 'LEMPChefCookbook::default' do
  include_context 'Ubuntu 16.04'

  before do
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('secrets', 'secrets').and_return('mysql_password' => 'password')
  end
end
