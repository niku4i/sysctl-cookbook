#
# Cookbook Name:: sysctl
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/sysctl.conf" do
  action :create
  source 'sysctl.conf.erb'
  notifies :run, "execute[sysctl -p /etc/sysctl.conf]"
  only_if do
    node['sysctl']['params'] && !node['sysctl']['params'].empty?
  end
end

execute "sysctl -p /etc/sysctl.conf" do
  action :nothing # means run only when another resource notifies it
end
