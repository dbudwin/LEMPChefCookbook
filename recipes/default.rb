apt_update 'update'

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

include_recipe 'acme::default'

acme_selfsigned 'budw.in' do
  crt '/etc/ssl/budw.in.crt'
  key '/etc/ssl/budw.in.key'
end

include_recipe 'LEMPChefCookbook::nginx'
include_recipe 'LEMPChefCookbook::mysql'
include_recipe 'LEMPChefCookbook::php'

secrets = Chef::EncryptedDataBagItem.load('secrets', 'secrets')

node.default['acme']['contact'] = [secrets['acme_contact']]

acme_ssl_certificate '/etc/ssl/budw.in.crt' do
  cn 'budw.in'
  output :fullchain
  key '/etc/ssl/budw.in.key'
  webserver :nginx
  notifies :reload, 'service[nginx]'
  owner node[:nginx][:user]
  wwwroot '/var/www/budw.in'
end

include_recipe 'composer::default'
