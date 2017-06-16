include_recipe 'LEMPChefCookbook::mysql'
include_recipe 'LEMPChefCookbook::php'

directory '/var/www' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

node['lemp']['sites'].each do |site|
  directory "/var/www/#{site}" do
    owner 'root'
    group 'www-data'
    mode '0755'
    action :create
  end
end

include_recipe 'LEMPChefCookbook::nginx'
include_recipe 'acme::default'

# secrets = Chef::EncryptedDataBagItem.load('secrets', 'secrets')

# node.default['acme']['contact'] = [secrets['acme_contact']]

# acme_ssl_certificate '/etc/ssl/budw.in.crt' do
#   cn 'budw.in'
#   output :fullchain
#   key '/etc/ssl/private/budw.in.key.pem'
#   min_validity 30
#   webserver :nginx
# end

include_recipe 'composer::default'
