#
# Cookbook:: chocolatey_server
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "chocolatey::default"

chocolatey_package 'chocolatey.server' do
    action :upgrade
end

%w[IIS-WebServer IIS-ASPNET45].each do |feature|
  windows_feature feature do
    action :install
    all true
  end
end

include_recipe "iis::remove_default_site"

iis_pool 'chocolatey' do
  runtime_version "4.0"
  action :add
  thirty_two_bit true
end

iis_site 'chocolatey' do
  protocol :http
  port 80
  path 'C:\tools\chocolatey.server'
  application_pool 'chocolatey'
  action [:add,:start]
end

directory 'C:\tools\chocolatey.server' do
    action :create
    rights :read, ['IUSR','IIS_IUSRS','IIS Apppool\chocolatey'], :applies_to_children => true
end

directory 'C:\tools\chocolatey.server\App_Data' do
    action :create
    rights :modify, 'IIS_IUSRS', :applies_to_children => true
    rights :modify, 'IIS Apppool\chocolatey', :applies_to_children => true
end
