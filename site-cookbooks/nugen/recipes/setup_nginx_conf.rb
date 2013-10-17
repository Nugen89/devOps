# sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"


service "nginx" do
  action :stop
end

execute "move default nginx conf" do
  action :run
  command "mv /etc/nginx/nginx.conf /etc/nginx/nginx_old.conf"
end

template "/etc/nginx/nginx.conf" do
  source "nginx_conf"
  owner "root"
  group "root"
  mode 0644
  notifies :start, "service[nginx]"
end




# include_recipe "apache2"

# # disable default site
# apache_site "000-default" do
#   enable false
# end

# # create apache config
# template "#{node[:apache][:dir]}/sites-available/myface.conf" do
#   source "apache2.conf.erb"
#   notifies :restart, 'service[apache2]'
# end

# # create document root
# directory "/srv/apache/myface" do
#   action :create
#   recursive true
# end

# # write site
# cookbook_file "/srv/apache/myface/index.html" do
#   mode "0644" # forget me to create debugging exercise
# end

# # enable myface
# apache_site "myface.conf" do
#   enable true
# end