#
# Cookbook Name:: osquery
# Recipe:: default
#
# All rights reserved - Do Not Redistribute
# This cookbook will install the offical osquery stable repositories 
# and install osquery.

directory node['osquery']['dir'] do
  owner 'root'
  group 'root'
  action :create
end

directory node['osquery']['config']['options']['osquery_log_dir'] do
  owner 'root'
  group 'root'
  action :create
end

file ::File.join(node['osquery']['dir'], 'osquery.conf') do
  content JSON.pretty_generate(node['osquery']['config'])
end

case node['platform_family']
when 'rhel'
  if "#{node['platform_version']}" >= '6' and "#{node['platform_version']}" < '7'
    yum_repo_package = 'https://osquery-packages.s3.amazonaws.com/centos6/noarch/osquery-s3-centos6-repo-1-0.0.noarch.rpm'
  elsif "#{node['platform_version']}" >= '7'
    yum_repo_package = 'https://osquery-packages.s3.amazonaws.com/centos7/noarch/osquery-s3-centos7-repo-1-0.0.noarch.rpm'
  end
  remote_file "#{Chef::Config[:file_cache_path]}/osquery-repo.rpm" do
    source yum_repo_package
    action :create
    notifies :install, 'rpm_package[osquery-repo]'
  end
  rpm_package 'osquery-repo' do
    source "#{Chef::Config[:file_cache_path]}/osquery-repo.rpm"
    action :install
    notifies :install, 'yum_package[osquery]'
  end
  yum_package 'osquery' do
    action :install
    notifies :start, 'service[osqueryd]'
  end
  
when 'debian'
  apt_repository 'osquery' do
    uri "https://osquery-packages.s3.amazonaws.com/#{node['lsb']['codename']}"
    distribution node['lsb']['codename']
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key 'C9D8B80B'
    notifies :install, 'apt_package[osquery]'
  end
  apt_package 'osquery' do
    action :install
    notifies :start, 'service[osqueryd]'
  end
end

service 'osqueryd' do
  action :start
  not_if { File.exist?(node[:osquery][:config][:options][:pidfile]) } 
end