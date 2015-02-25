name             'osquery'
maintainer       'Maus Stearns'
maintainer_email ''
license          'All rights reserved'
description      'Installs/Configures osquery'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0'

depends 'apt'
depends 'runit'
supports 'centos', '>=6.0'
supports 'ubuntu', '>=12.04'