#
# Cookbook Name:: cida_jenkins
# Recipe:: install_deps
#
# Copyright (c) 2015 The Authors, All Rights def Reserved(
# 
# Description: Installs dependencies if required
system("which git")
include_recipe 'git' unless $?.exitstatus == 0

system("which mvn")
include_recipe 'maven' unless $?.exitstatus == 0

