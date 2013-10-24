# user_account 'deployer' do
#   # keys for file ~/.ssh/authorized keys
#   ssh_keys  ['ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfDxvFvEiC3n/FZ/qX1tGAuFa9geQPkBDTk4+mqkUQun301sCVmCKlWDY4k/AgNQJYUk4Gr+ZSMNIH5InEL2ypuw9rS4WC7Wg2yVTklJW9F1hCYavrA6TgaRIprr55EfKHfRmmNuGsl+gKxYqiIZbIRwPy3tWz0CI/7LL/odoFR8KnxTUPwA/mddhXVmeipJIXBseVa9Dw3eNGE7EAZQrC3geAXsHxu1K8zJUbu5TTamgEDTS1d/JwuDqiRmSX/h1HeqPe92pSjKWg+r4CDA6BD9o5upUVZZaY9XzMVJ56k7W8E5ydtou3mS0cbvkLomcQrjEygglolIKzWBbqQt7X nguyen.david89@gmail.com']
# end

# group "admin" do
#   members ['nugen', 'deployer']
#   action :create
# end

# group "sudo" do
#   members ['nugen', 'deployer']
#   action :create
# end

group "sysadmin"

user node[:nugen][:user] do
  group node[:nugen][:group]
  system true
  shell "/bin/bash"
end

user "deployer" do
  group node[:nugen][:group]
  system true
  shell "/bin/bash"
end

