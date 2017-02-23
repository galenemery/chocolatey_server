#
# Cookbook:: chocolatey_server
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chocolatey_server::server' do
  context 'When all attributes are default, on Windows' do
    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2').converge(described_recipe) }

    # The run doesn't use package to install chocolatey, some other test is needed'
    # it 'installs chocolatey' do
    #   expect(chef_run).to install_package('chocolatey')
    # end

    it 'installs/upgrades chocolatey.server' do
      expect(chef_run).to upgrade_chocolatey_package('chocolatey.server')
    end

   # How to test windows_feature IIS-WebServer and IIS-ASPNET45

    it 'sets permissions on C:\tools\chocolatey.server' do
    expect(chef_run).to create_directory('C:\tools\chocolatey.server').with(
      rights: [
        { permissions: :read, principals: ['IUSR','IIS_IUSRS','IIS Apppool\chocolatey'], applies_to_children: true },
        # { permissions: :read, principals: 'IIS_IUSRS', applies_to_children: true },
        # { permissions: :read, principals: 'IIS Apppool\chocolatey', applies_to_children: true }
      ])
    end
    
    it 'sets permissions on C:\tools\chocolatey.server\App_Data' do
      expect(chef_run).to create_directory('C:\tools\chocolatey.server\App_Data').with(
      rights: [
        { permissions: :modify, principals: 'IIS_IUSRS', applies_to_children: true },
        { permissions: :modify, principals: 'IIS Apppool\chocolatey', applies_to_children: true }
      ])
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

describe 'example::default' do
  
end