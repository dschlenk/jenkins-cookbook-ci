# jenkins-cookbook-ci cookbook

This cookbook exists to define a Chef Resource to simplify the use of Jenkins 
CI for Chef cookbook development.  Originally forked from 
[cooking-with-jenkins](https://github.com/zts/cooking-with-jenkins/tree/master/definitions) - see
[the accompanying blog post](http://www.cryptocracy.com/blog/2014/01/03/cooking-with-jenkins-test-kitchen-and-docker/)
for details and commentary.

# Requirements

CentOS 6.x and Ubuntu/Debian derivatives are supported. 

# Usage

While there is a default recipe in this cookbook, it exists mostly for testing
and the intent is for you to write your own wrapper cookbook to manage your 
Jenkins install utilizing 
[the Chef maintained Jenkins cookbook](https://github.com/opscode-cookbooks/jenkins)
and simply use the `cookbook_ci` resource defined in this cookbook to make
defining jobs that test Chef cookbooks less verbose. 

# `cookbook_ci` Resource

To use the `cookbook_ci` resource, simply include this cookbook as a dependency in your metadata.rb file and then use the definition like so: 

```
cookbook_ci "test" do
  repository "https://github.com/zts/test-cookbook.git"
  branch "master"
  foodcritic true
  chefspec true
  kitchen false
  junit_results true
end
```

# Author

Author:: Zachary Stevens (<zts@cryptocracy.com>)
Author:: David Schlenk (<david.schlenk@spanlink.com>)
