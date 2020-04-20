name 'chocolatey_server'
maintainer 'Galen Emery,Asif Shaikh'
maintainer_email 'galen@galenemery.com,ripclaw_ffb@hotmail.com'
license 'apache2'
description 'Installs/Configures chocolatey_server'
long_description 'Installs/Configures chocolatey_server'
version '0.2.0'
supports 'windows'

depends 'iis'
depends 'chocolatey'

issues_url 'https://github.com/galenemery/chocolatey_server/issues' if respond_to?(:issues_url)
source_url 'https://github.com/galenemery/chocolatey_server' if respond_to?(:source_url)
