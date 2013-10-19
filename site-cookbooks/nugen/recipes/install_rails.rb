# Specify the rails version

execute "Install rails" do
  command <<-EOC
    gem install rails --no-ri --no-rdoc
    exec $SHELL -l
  EOC
  action :run
end
