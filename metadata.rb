name 'LEMPChefCookbook'
maintainer 'Drew Budwin'
maintainer_email 'drew@budw.in'
license 'GPL-3.0'
description 'Installs/Configures LEMPChefCookbook'
long_description 'Installs/Configures LEMPChefCookbook'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/dbudwin/LEMPChefCookbook/issues'
source_url 'https://github.com/dbudwin/LEMPChefCookbook'
supports 'ubuntu'

depends 'acme', '~> 3.1.0'
depends 'chef_nginx', '~> 6.1.1'
depends 'composer', '~> 2.6.0'
depends 'mysql', '~> 8.4.0'
depends 'php', '~> 4.2.0'
