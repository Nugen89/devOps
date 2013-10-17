#
# Cookbook Name:: deployer
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group "users"

user "deployer" do
  group "sysdamin"
  system true
  shell "/bin/bash"
end

# user "random" do
#   supports :manage_home => true
#   comment "Random User"
#   uid 1234
#   gid "users"
#   home "/home/random"
#   shell "/bin/bash"
#   password "$1$JJsvHslV$szsCjVEroftprNn4JHtDi."
# end


# user_home = "/#{node[:matching_node][:user]}"

# user node[:matching_node][:group] do
#   gid node[:matching_node][:group]
#   shell "/bin/bash"
#   home user_home
#   system true
#   action :create
# end