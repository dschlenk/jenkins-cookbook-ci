#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: install_deps
#
# installs packages required for CI testing cookbooks
#
# Copyright (C) 2013 Zachary Stevens
# Modifed 2014 David Schlenk
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# We'll be pulling code using git
include_recipe 'git::default'

# We'll need a ruby to run cookbook tests, and some of the gems we'll
# be installing need a few dev packages installed
node['jenkins_cookbook_ci']['ruby_packages'].each { |p| package p }

# some platforms have turribly old ruby, so we'll use system-wide rvm instead.
case node['platform_family']
when 'rhel'
  include_recipe 'rvm::user'
end

if node['jenkins_cookbook_ci'].has_key? 'gem_packages'
  node['jenkins_cookbook_ci']['gem_packages'].each { |p| gem_package p }
end

# We'll be running cookbook integration tests under Docker maybe
case node['platform_family']
when 'debian','ubuntu'
  unless node['cloud']
    include_recipe "docker" 
  end
end

include_recipe 'jenkins-cookbook-ci::configure-jenkins'
