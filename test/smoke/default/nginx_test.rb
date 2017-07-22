describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe command('ls /etc/nginx/sites-enabled/') do
  its(:stdout) { should match(/budw\.in(\s+)robohome\.xyz/) }
end

describe command('nginx -t') do
  its(:stderr) { should include('nginx: the configuration file /etc/nginx/nginx.conf syntax is ok') }
  its(:stderr) { should include('nginx: configuration file /etc/nginx/nginx.conf test is successful') }
end
