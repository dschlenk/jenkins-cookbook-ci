#
# Cookbook Name:: cooking-with-jenkins
# Recipe:: configure-jenkins
#
# Adds plugins and common configuration we'll rely on in our Jenkins
# job definitions.
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

# These plugins allow us to pull code (for jobs) from git
jenkins_plugin "scm-api"
jenkins_plugin "git-client"
jenkins_plugin "git"

# This colourises console output, instead of displaying literal ansi
# escape sequences in the browser.
jenkins_plugin "ansicolor"


jenkins_plugin "token-macro"

# You can use this plugin to enable docker for kitchen tests in your wrapper cookbook if you please.
jenkins_plugin "config-file-provider"

# common optional dependencies
jenkins_plugin "ant"
jenkins_plugin "javadoc"
jenkins_plugin "maven-plugin"

# This plugin lets us parse console output to report on warnings.
# We'll use this to extract foodcritic's complaints, per the
# instructions on http://acrmp.github.io/foodcritic/#ci
jenkins_plugin "analysis-core"
jenkins_plugin "violations"
jenkins_plugin "dashboard-view"
jenkins_plugin "warnings"
# install the rvm plugin for rhel derivatives
case node['platform_family']
when 'rhel'
  jenkins_plugin "ruby-runtime"
  jenkins_plugin "rvm"
end
cookbook_file "#{node[:jenkins][:master][:home]}/hudson.plugins.warnings.WarningsPublisher.xml" do
  owner "jenkins"
  group "jenkins"
  mode "0644"
  notifies :restart, "service[jenkins]"
end
