#
# Cookbook Name:: osquery
# Recipe:: default
#
# Copyright 2014, Maus Stearns
#
# All rights reserved - Do Not Redistribute
# Basic osquery deployment via chef
# Typically you would have the RPM in a repo and not local file...

dependencies = %w{ snappy libunwind-devel }
packages = %w{ osquery-1.2.2-Linux }

dependencies.each do |dep|
  yum_package dep do
    action :upgrade
  end
end

packages.each do |package|
  cookbook_file "/tmp/#{package}.rpm" do
    source "#{package}.rpm"
    owner 'root'
    group 'root'
    mode '750'
    action :create
  end
  rpm_package package do
    source "/tmp/#{package}.rpm"
    action :install
  end
end

directory node['osquery']['dir'] do
  owner 'root'
  group 'root'
  action :create
end

directory node['osquery']['logdir'] do
  owner 'root'
  group 'root'
  action :create
end

file ::File.join(node['osquery']['dir'], 'osquery.conf') do
  content JSON.pretty_generate(node['osquery']['config'])
end

template "osqueryd.conf" do
  path "#{node[:osquery][:dir]}/osqueryd.conf"
  source "osqueryd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
end

template "osquery" do
  path "/etc/init.d/osquery"
	source 'osquery.erb'
	owner 'root'
	group 'root'
	mode '751'
end

service "osquery" do
  supports :status => true, :restart => true, :start => true, :stop => true
  action :start
end