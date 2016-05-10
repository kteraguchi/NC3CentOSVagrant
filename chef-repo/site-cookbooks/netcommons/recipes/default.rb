#
# Cookbook Name:: netcommons
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'system'
include_recipe 'locale'
include_recipe 'git'

include_recipe 'apache2'
web_app 'web_app' do
  cookbook "apache2"
  docroot "#{node['apache']['docroot_dir']}/NetCommons3/app"
  server_name node['hostname']
  allow_override 'All'
  enable true
end
include_recipe 'apache2::mod_php5'

# http://qiita.com/soundws/items/cc84da42419f1ab3443b
case node['platform']
when 'redhat', 'centos', 'scientific'
  include_recipe 'yum-epel::default'
end
include_recipe 'php::package'
include_recipe 'composer'

include_recipe 'mariadb'

include_recipe 'nodejs'

directory "#{node['apache']['docroot_dir']}/NetCommons3" do
  owner 'vagrant'
  group 'vagrant'
  mode  0755
  action :create
end

git "#{node['apache']['docroot_dir']}/NetCommons3" do
  repository 'https://github.com/NetCommons3/NetCommons3.git'
  user 'vagrant'
  action :checkout
  # action :sync  # http://babiy3104.hateblo.jp/entry/2014/02/14/222005
end

composer_project "#{node['apache']['docroot_dir']}/NetCommons3" do
  dev true
  quiet false
  user 'vagrant'
  group 'vagrant'
  action :install
end

execute "bower_install" do
  command "bower install --allow-root"
  cwd "#{node['apache']['docroot_dir']}/NetCommons3"
  user 'vagrant'
  group 'vagrant'
end
