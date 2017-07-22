include_recipe 'chef_nginx::default'

node['lemp']['sites'].each do |site|
  nginx_site site do
    template "#{site}/#{site}.erb"
    action :enable
    notifies :reload, 'service[nginx]', :immediately
  end

  # cookbook_file "/etc/nginx/snippets/ssl-params.#{site}.conf" do
  #   source "#{site}/ssl-params-#{site}.conf"
  #   owner 'root'
  #   group 'root'
  #   mode '0644'
  #   action :create
  # end
end

# Temp to copy index.html for testing
cookbook_file '/var/www/budw.in/index.html' do
  source 'budw.in/index.html'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

directory '/var/www/robohome.xyz/public' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file '/var/www/robohome.xyz/public/index.html' do
  source 'robohome.xyz/index.html'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/var/www/robohome.xyz/public/phpinfo.php' do
  source 'robohome.xyz/phpinfo.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

cookbook_file '/var/www/budw.in/phpinfo.php' do
  source 'budw.in/phpinfo.php'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
# End temp
