#
# Cookbook Name:: cida_jenkins
# Recipe:: jenkins_config_wrapper
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: A wrapper recipe that updates the Jenkins RHEL configuration template
# TODO- Can be removed if/when upstream opscode-jenkins merges my pull request @ https://github.com/opscode-cookbooks/jenkins/pull/320

begin
  r = resources(:template => "/etc/sysconfig/jenkins")
  r.cookbook "cida_jenkins"
  r.source "jenkins-config-rhel.erb"
  r.mode '0644'
  r.notifies :restart, 'service[jenkins]', :immediately
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template to override!"
end