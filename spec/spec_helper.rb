require 'chefspec'
require 'chefspec/berkshelf'

shared_examples 'install required features' do
  it 'installs necessary windows features' do
    features.each do |feature_name|
      expect(chef_run).to install_windows_feature(feature_name)
    end
  end
end