# include_recipe "rbenv::default"

# rbenv_ruby "1.9.3-p194"

# # Install a specific GEM
# rbenv_gem "bundler" do
#   ruby_version "1.9.3-p194"
# end

# Ubuntu note: 
# Use ~/.profile instead of ~/.bash_profile below. Also, we’ll need to install some dependencies first:

execute "Setup rbenv and ruby" do
  command <<-EOC
    sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev
		git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
		git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
		echo 'export RUBY_CFLAGS="-march=native -O3"' >> ~/.profile
		echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
		echo 'eval "$(rbenv init -)"' >> ~/.profile
		exec $SHELL -l
		rbenv install 1.9.3-p392
		rbenv global 1.9.3-p392 
		rbenv rehash
  EOC
  action :run
end


