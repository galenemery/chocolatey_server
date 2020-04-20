#
# Cookbook:: chocolatey_server
# Spec:: windows
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chocolatey_server::default' do
  context 'When all attributes are default, on Windows 2012' do

    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2012').converge(described_recipe) }

    it 'installs chocolatey.server' do
      expect(chef_run).to install_chocolatey_package('chocolatey.server')
    end

    let(:features) do
      %w[ IIS-WebServer IIS-ASPNET45 ]
    end

    include_examples 'install required features'

    let(:attribute) {chef_run.node['site']}

    it 'site name' do
      expect(attribute['name']).to eq 'Chocolatey'
    end

    it 'site bindings' do
      expect(attribute['bindings']).to eq 'http/*:80:*'
    end

    it 'site_packages_path' do
      expect(attribute['packages_path']).to eq 'C:\Tools\chocolatey.server\App_Data\Packages'
    end

    it 'sets permissions on C:\Tools\chocolatey.server' do
    expect(chef_run).to create_directory('C:\Tools\chocolatey.server').with(
      rights: [
        { permissions: :read, principals: ['IUSR','IIS_IUSRS','IIS Apppool\Chocolatey'], applies_to_children: true },
      ])
    end
    
    it 'sets permissions on C:\Tools\chocolatey.server\App_Data\Packages' do
      expect(chef_run).to create_directory('C:\Tools\chocolatey.server\App_Data\Packages').with(
      rights: [
        { permissions: :modify, principals: 'IIS_IUSRS', applies_to_children: true },
        { permissions: :modify, principals: 'IIS Apppool\Chocolatey', applies_to_children: true }
      ])
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

  end

  context 'When all attributes are default, on Windows 2012 R2' do

    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2012R2').converge(described_recipe) }

    it 'installs chocolatey.server' do
      expect(chef_run).to install_chocolatey_package('chocolatey.server')
    end

    let(:features) do
      %w[ IIS-WebServer IIS-ASPNET45 ]
    end

    include_examples 'install required features'

    let(:attribute) {chef_run.node['site']}

    it 'site name' do
      expect(attribute['name']).to eq 'Chocolatey'
    end

    it 'site bindings' do
      expect(attribute['bindings']).to eq 'http/*:80:*'
    end

    it 'site packages path' do
      expect(attribute['packages_path']).to eq 'C:\Tools\chocolatey.server\App_Data\Packages'
    end

    it 'sets permissions on C:\Tools\chocolatey.server' do
    expect(chef_run).to create_directory('C:\Tools\chocolatey.server').with(
      rights: [
        { permissions: :read, principals: ['IUSR','IIS_IUSRS','IIS Apppool\Chocolatey'], applies_to_children: true },
      ])
    end
    
    it 'sets permissions on C:\Tools\chocolatey.server\App_Data\Packages' do
      expect(chef_run).to create_directory('C:\Tools\chocolatey.server\App_Data\Packages').with(
      rights: [
        { permissions: :modify, principals: 'IIS_IUSRS', applies_to_children: true },
        { permissions: :modify, principals: 'IIS Apppool\Chocolatey', applies_to_children: true }
      ])
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

  end

  context 'When all attributes are default, on Windows 2016' do

    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2016').converge(described_recipe) }

    it 'installs chocolatey.server' do
      expect(chef_run).to install_chocolatey_package('chocolatey.server')
    end

    let(:features) do
      %w[ IIS-WebServer IIS-ASPNET45 ]
    end

    include_examples 'install required features'

    let(:attribute) {chef_run.node['site']}

    it 'site name' do
      expect(attribute['name']).to eq 'Chocolatey'
    end

    it 'site bindings' do
      expect(attribute['bindings']).to eq 'http/*:80:*'
    end

    it 'site_packages_path' do
      expect(attribute['packages_path']).to eq 'C:\Tools\chocolatey.server\App_Data\Packages'
    end

    it 'sets permissions on C:\Tools\chocolatey.server' do
    expect(chef_run).to create_directory('C:\Tools\chocolatey.server').with(
      rights: [
        { permissions: :read, principals: ['IUSR','IIS_IUSRS','IIS Apppool\Chocolatey'], applies_to_children: true },
      ])
    end
    
    it 'sets permissions on C:\Tools\chocolatey.server\App_Data\Packages' do
      expect(chef_run).to create_directory('C:\Tools\chocolatey.server\App_Data\Packages').with(
      rights: [
        { permissions: :modify, principals: 'IIS_IUSRS', applies_to_children: true },
        { permissions: :modify, principals: 'IIS Apppool\Chocolatey', applies_to_children: true }
      ])
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

  end

  context 'When all attributes are default, on Windows 2019' do

    let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'windows', version: '2019').converge(described_recipe) }

    it 'installs chocolatey.server' do
      expect(chef_run).to install_chocolatey_package('chocolatey.server')
    end

    let(:features) do
      %w[ IIS-WebServer IIS-ASPNET45 ]
    end

    include_examples 'install required features'

    let(:attribute) {chef_run.node['site']}

    it 'site name' do
      expect(attribute['name']).to eq 'Chocolatey'
    end

    it 'site bindings' do
      expect(attribute['bindings']).to eq 'http/*:80:*'
    end

    it 'site_packages_path' do
      expect(attribute['packages_path']).to eq 'C:\Tools\chocolatey.server\App_Data\Packages'
    end

    it 'sets permissions on C:\Tools\chocolatey.server' do
    expect(chef_run).to create_directory('C:\Tools\chocolatey.server').with(
      rights: [
        { permissions: :read, principals: ['IUSR','IIS_IUSRS','IIS Apppool\Chocolatey'], applies_to_children: true },
      ])
    end
    
    it 'sets permissions on C:\Tools\chocolatey.server\App_Data\Packages' do
      expect(chef_run).to create_directory('C:\Tools\chocolatey.server\App_Data\Packages').with(
      rights: [
        { permissions: :modify, principals: 'IIS_IUSRS', applies_to_children: true },
        { permissions: :modify, principals: 'IIS Apppool\Chocolatey', applies_to_children: true }
      ])
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

  end
end
