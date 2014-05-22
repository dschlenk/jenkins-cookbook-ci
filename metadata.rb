name             'jenkins-cookbook-ci'
maintainer       'David Schlenk'
maintainer_email 'david.schlenk@spanlink.com'
license          'Apache 2.0'
description      'Cookbook to ease using Jenkins for Chef Cookbook CI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'java'
depends 'jenkins'
depends 'git'
depends 'docker'
