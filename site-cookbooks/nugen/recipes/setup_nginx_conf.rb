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

