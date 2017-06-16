include_recipe 'chef_nginx::default'

directory '/etc/nginx/snippets' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

node['lemp']['sites'].each do |site|
  nginx_site site do
    template "#{site}/#{site}.erb"
    action :enable
  end

  cookbook_file "/etc/nginx/snippets/ssl-params.#{site}.conf" do
    source "ssl-params-#{site}.conf"
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end
