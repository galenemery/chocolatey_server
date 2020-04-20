default['site']['name'] = 'Chocolatey'
default['site']['bindings'] = 'http/*:80:*'
default['site']['packages_path'] = 'C:\Tools\chocolatey.server\App_Data\Packages'
default['config']['allow_package_override'] = false
default['config']['apikey'] = 'change_me'
default['config']['max_file_size_bytes'] = '2147482548'
default['config']['require_apikey'] = true
default['config']['users'] = []
# Example:
# default['config']['users'] = [
#     {user: "chocolatey", password: "change_me"}
# ]
