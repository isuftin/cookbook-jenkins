#
# Cookbook Name:: cida_jenkins
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# include_attribute "cida_jenkins::default"

include_recipe 'cida_jenkins::create_chef_user'

include_recipe 'cida_jenkins::create_users'

include_recipe 'cida_jenkins::github_plugin'
