# # encoding: utf-8

# Inspec test for recipe chocolatey_server::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe chocolatey_package('chocolatey.server') do
  it { should be_installed }
end

describe windows_feature('Web-WebServer') do
  it { should be_installed }
end

describe windows_feature('NET-Framework-45-ASPNET') do
  it { should be_installed }
end

describe port(80) do
  it { should be_listening }
end

describe powershell('(Invoke-WebRequest -Uri localhost -UseBasicParsing).Content') do
  its('stdout') { should match /Chocolatey/ }
end