name             'cida_jenkins'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'usgs_pd'
description      'Installs and configures the Jenkins continuous integration server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'stig', '~> 0.2.1'
depends 'jenkins', '~> 2.2.2'