name             'cida_jenkins'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'usgs_pd'
description      'Installs/Configures cida_jenkins'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'wsi_tomcat', '= 0.1.0'
depends 'jenkins', '~> 2.2.1'