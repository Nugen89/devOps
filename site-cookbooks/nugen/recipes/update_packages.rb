execute "upgrade packages" do
  action :run
  command "apt-get -y upgrade"
end
