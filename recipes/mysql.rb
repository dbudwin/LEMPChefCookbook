secrets = Chef::EncryptedDataBagItem.load('secrets', 'secrets')

# Connect using 'mysql -S /var/run/mysql-robohome/mysqld.sock -u root -p'
mysql_service 'robohome' do
  port '3306'
  version '5.7'
  initial_root_password secrets['mysql_password']
  action [:create, :start]
end
