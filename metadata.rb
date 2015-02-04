name             'cida_jenkins'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'Public Domain'
description      'Installs and configures the Jenkins continuous integration server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'

recommends 'git', '~> 4.1.0'
recommends 'maven', '~> 1.2.0'
depends 'jenkins', '~> 2.2.2'