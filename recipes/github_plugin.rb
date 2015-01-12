#
# Cookbook Name:: cida_jenkins
# Recipe:: github_plugin
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: 
include_recipe "jenkins::master"

jenkins_plugin 'github' do
  action :install
  notifies :reload, "service[jenkins]", :delayed
end