name             'cooking-with-jenkins'
maintainer       'David Schlenk'
maintainer_email 'david.schlenk@spanlink.com'
license          'Apache 2.0'
description      'Utility cookbook to aid in use of Jenkins for Chef Cookbook CI'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

# We'll be needing jenkins
depends 'jenkins', '~> 1.2.0'

# We'll be pulling cookbooks using git
depends 'git', '~> 2.5'

# We'll run integration tests using docker
depends 'docker', '~> 0.20'
