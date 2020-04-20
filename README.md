# chocolatey_server

This cookbook installs chocolatey server (and dependencies) for you.

Requirements
------------
### Platform
- Windows Server 2012
- Windows Server 2012 R2
- Windows Server 2016
- Windows Server 2019

### Cookbooks
- chocolatey
- iis

Attributes
----------
- `node['site']['name']` - IIS website name - Default: `Chocolatey`
- `node['site']['bindings']` - IIS site binding - Default: `http/*:80:*`
- `node['site']['packages_path']` - Path to where uploaded packages are stored - Default: `C:\Tools\chocolatey.server\App_Data\Packages`
- `node['config']['allow_package_override']` - Allow overwriting of chocolatey packages = Default: `false`
- `node['config']['apikey']` - API key to push packages - `change_me`
- `node['config']['max_file_size_bytes']` - Max package size allows - Default: `2147482548`
- `node['config']['require_apikey']` - Whether API key is required to upload packages - Default: `true`
- `node['config']['users']` - Chocolatey site users - Default: `[]`
  - Example:
    ```
    node['config']['users'] = [
      {user: "chocolatey", password: "change_me"}
    ]
    ```