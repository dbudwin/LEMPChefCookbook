describe port(3306) do
  it { should be_listening }
end

describe service('mysql-robohome') do
  it { should be_enabled }
  it { should be_running }
end

describe command('mysql --version') do
  its(:stdout) { should contain('Ver 14.14 Distrib 5.7.18') }
end
