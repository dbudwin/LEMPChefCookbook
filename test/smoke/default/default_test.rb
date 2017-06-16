describe user('root') do
  it { should exist }
end

describe package('git') do
  it { should be_installed }
end
