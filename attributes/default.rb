case node['platform_family']
when 'debian','ubuntu'
  default['jenkins_cookbook_ci']['ruby_packages']   = ['ruby1.9.3', 'rake', 'ruby-bundler', 'libxml2-dev', 'libxslt-dev']
when 'rhel'
  default['jenkins_cookbook_ci']['ruby_packages']   = ['libxml2-devel', 'libxslt-devel']
  default['rvm']['default_ruby'] = 'ruby-1.9.3'
end
default['jenkins_cookbook_ci']['wrapper_support'] = false
