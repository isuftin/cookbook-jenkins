#
# Cookbook Name:: cida_jenkins
# Recipe:: create_users
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: 
include_recipe "jenkins::master"

users = data_bag('users')

users.each do |u|
  user = data_bag_item('users', u)
  jenkins_user user.id do
    full_name user["full_name"]
    email user["email"]
    password user["password"]
    public_keys user["public_keys"]
  end
end