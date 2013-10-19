# template '/etc/apt/sources.list.d/my_apt_sources.list' do
#   notifies :run, 'execute[apt-get update]', :immediately
# end

execute "update and upgrade packages" do
  action :run
  command "apt-get -y update"
  # command "apt-get -y upgrade"
end

# execute "apt-get-update" do
#   command "apt-get update"
#   ignore_failure true
#   action :nothing
# end

# package "update-notifier-common" do
#   notifies :run, resources(:execute => "apt-get-update"), :immediately
# end

# execute "apt-get-update-periodic" do
#   command "apt-get update"
#   ignore_failure true
#   only_if do
#    File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
#    File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
#   end
# end