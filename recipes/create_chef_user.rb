#
# Cookbook Name:: cida_jenkins
# Recipe:: create_chef_user
# Author: Ivan Suftin < isuftin@usgs.gov >
#
# Description: 

require 'openssl'
require 'net/ssh'

chef_jenkins_private_key = OpenSSL::PKey::RSA.new(Chef::EncryptedDataBagItem.load('keys', 'chef-jenkins-private')['private_key']).to_pem
chef_jenkins_public_key = data_bag_item('keys', 'chef-jenkins-public')['public_key']

# Create the Jenkins user with the public key
jenkins_user 'chef-jenkins' do
  full_name   'Chef Jenkins Client'
  email 'chef-jenkins@chef.owiclient.org'
  public_keys [chef_jenkins_public_key]
  action :create
  notifies :execute, "jenkins_script[setup authentication]", :immediately
  notifies :execute, "jenkins_command[clear-queue]", :immediately
end

# Set the private key on the Jenkins executor
node.run_state[:jenkins_private_key] = chef_jenkins_private_key

# Turn on basic authentication
jenkins_script 'setup authentication' do
  command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    def instance = Jenkins.getInstance()
    import hudson.security.*
    def realm = new HudsonPrivateSecurityRealm(false)
    instance.setSecurityRealm(realm)
    def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)
    instance.save()
  EOH
  action :nothing
end

# Run some commands - this will ensure the CLI is correctly passing attributes
jenkins_command 'clear-queue' do
  action :nothing
end