describe user('root') do
  it { should exist }
end

describe group('www-data') do
  it { should exist }
end

describe package('git') do
  it { should be_installed }
end

describe command('composer') do
  it { should exist }
end

describe directory('/var/www/budw.in') do
  it { should exist }
  its('group') { should eq('www-data') }
  its('owner') { should eq('root') }
end

describe directory('/var/www/robohome.xyz') do
  it { should exist }
  its('group') { should eq('www-data') }
  its('owner') { should eq('root') }
end
