describe service('php7.0-fpm') do
  it { should be_enabled }
  it { should be_running }
end

describe package('php7.0-fpm') do
  it { should be_installed }
end

describe package('php-mysql') do
  it { should be_installed }
end

describe package('php-mbstring') do
  it { should be_installed }
end

describe command('php -v') do
  its(:stdout) { should contain('PHP 7.0.15-0') }
end
