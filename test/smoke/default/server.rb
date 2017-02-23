# # encoding: utf-8

# Inspec test for recipe chocolatey_server::server

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe package('chocolatey.server') do
  it { should be_installed }
end

describe windows_feature('IIS-WebServer')) do
  it { should be_installed }
  skip 'It should install IIS'
end

describe port(80) do
  it { should_not be_listening }
  skip 'It should disable the default IIS website'
end

describe port(80) do
  it { should_not be_listening }
  skip 'It should set up the apppool for chocolatey'
end

describe port(80) do
  it { should_not be_listening }
  skip 'It should disable the default IIS website'
end