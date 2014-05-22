#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: default
#
# Copyright (C) 2013 Zachary Stevens
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

# Install dependencies
include_recipe "jenkins-cookbook-ci::install_deps"

# Prepare docker for use under jenkins
case node['platform_family']
when 'debian','ubuntu'
  unless node['cloud']
    include_recipe "jenkins-cookbook-ci::configure-docker" 
  end
end

# Prepare jenkins for running jobs
include_recipe "jenkins-cookbook-ci::configure-jenkins"

# Create jobs for the cookbooks we're testing
include_recipe "jenkins-cookbook-ci::define-jenkins-jobs" do
  not_if node['jenkins_cookbook_ci']['wrapper_support']
end
