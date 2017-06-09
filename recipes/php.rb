include_recipe 'php::default'

php_fpm_pool 'php-fpm' do
  action :install
end

apt_package 'php-mysql' do
  action :install
end

apt_package 'php-mbstring' do
  action :install
end

service 'php7.0-fpm' do
  action :restart
end
