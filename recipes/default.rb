#
# Cookbook:: chocolatey_server
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'chocolatey::default'

chocolatey_package 'chocolatey.server' do
  action :install
end

%w(IIS-WebServer IIS-ASPNET45).each do |feature|
  windows_feature feature do
    action :install
    all true
  end
end

include_recipe 'iis::remove_default_site'

iis_pool node['site']['name'] do
  runtime_version '4.0'
  action :add
  thirty_two_bit true
end

iis_site node['site']['name'] do
  bindings node['site']['bindings']
  path 'C:\Tools\chocolatey.server'
  application_pool node['site']['name']
  action [:add, :config, :start]
end

directory 'C:\Tools\chocolatey.server' do
  action :create
  rights :read, ['IUSR', 'IIS_IUSRS', "IIS Apppool\\#{node['site']['name']}"], applies_to_children: true
end

directory node['site']['packages_path'] do
  action :create
  rights :modify, 'IIS_IUSRS', applies_to_children: true
  rights :modify, "IIS Apppool\\#{node['site']['name']}", applies_to_children: true
  #notifies :restart, "iis_site[#{node['site']['name']}]", :delayed
end

template 'C:\Tools\chocolatey.server\Web.config' do
  source 'web.config.erb'
  variables(allow_package_override: node['config']['allow_package_override'],
            apikey: node['config']['apikey'],
            max_file_size_bytes: node['config']['max_file_size_bytes'],
            packages_path: node['site']['packages_path'],
            require_apikey: node['config']['require_apikey'],
            users: node['config']['users'])
end