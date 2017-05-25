name 'build_cookbook'
maintainer 'Drew Budwin'
maintainer_email 'drew@budw.in'
license 'gplv3'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
