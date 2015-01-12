#
# Cookbook Name:: cida_jenkins
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'cida_jenkins::create_users'

include_recipe 'cida_jenkins::github_plugin'
