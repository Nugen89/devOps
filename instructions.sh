http://brandonparsons.me/2012/chef-recipes-for-rails-deployment/
http://www.captnswing.net/2013/01/how-i-use-vagrant-with-chef-solo.html

xclip -sel clip < ~/.ssh/id_rsa.pub

chef-solo -c run_recipes.rb -j node.json

http://downloads.vagrantup.com/tags/v1.3.5

https://github.com/mitchellh/vagrant/wiki/Installing-Vagrant-from-source
git clone https://github.com/mitchellh/vagrant.git
bundle install
rake install

gem install berkshelf

vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
vagrant plugin list

rbenv rehash

---------------------------------------------------------------------------------

vagrant init

Create Gemfile with "Chef, knife-solo, berkshelf"

$ cat > Gemfile <<EOF
source 'https://rubygems.org'
gem "chef" # The main gem
gem "knife-solo" # Chef solo to bootstrap/configure chef on individual machines through ssh
gem "berkshelf" # To manage cookbooks
EOF
bundle install


knife solo init . # Creates the chef-repo here
# Creates the knife-solo folder structure 
# Creates Berksfile if Berkshelf is installed and plugin is setup

# Regular way of installing cookbooks through Knife
knife cookbook site install blah
# Berkshelf replaces this with a Berksfile to manage dependencies like a Gemfile

Update the Berksfile with the relevant cookbooks

berks install


vagrant reload # Recreate VM and install chef
vagrant provision # Use Chef-Solo to install cookbooks



mkpasswd -m sha-512 -S mySalt4324

mkpasswd -m sha-512 -S mySalt


# Next, we use knife prepare to copy the cookbooks to the remote machine.
	knife solo prepare vagrant@192.168.33.10
# Then instruct chef to provision the server using the relevant node file:
	knife solo cook vagrant@192.168.33.10 nodes/default.json
# Finally we remove traces of the Chef config from the remote machine:
	knife solo wash_up vagrant@192.168.33.10


# … to start vm
# … NOTE: will take a while to download the image the first time it is run
vagrant up

# … to re-provision
vagrant provision

# … to ssh into the vm and monkey around
vagrant ssh

# … to destroy vm
vagrant destroy




# Check outputs
vagrant ssh -c "getent passwd myface"

vagrant ssh -c "sudo /sbin/service nginx status"

grep ip: Vagrantfile



apt-get --yes --force-yes install $something


http://cbednarski.com/articles/installing-ruby/

http://docs.opscode.com/essentials_nodes_chef_run.html

http://ariejan.net/2011/09/14/lighting-fast-zero-downtime-deployments-with-git-capistrano-nginx-and-unicorn/