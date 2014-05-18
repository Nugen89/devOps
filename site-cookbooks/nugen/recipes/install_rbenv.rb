# include_recipe "rbenv::default"

# rbenv_ruby "1.9.3-p194"

# # Install a specific GEM
# rbenv_gem "bundler" do
#   ruby_version "1.9.3-p194"
# end

# Ubuntu note: 
# Use ~/.profile instead of ~/.bash_profile below. Also, we’ll need to install some dependencies first:

# execute "Setup rbenv and ruby" do
# command <<-EOC
# EOC
# action :run
# end

execute "install ruby/rails dependencies" do
  command "sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev"
  action :run
end

execute "clone rbenv" do
  command "git clone git://github.com/sstephenson/rbenv.git ~/.rbenv"
  action :run
end

execute "clone ruby-build" do
  command "git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
  action :run
end

execute "export ruby cflags" do
  command "echo 'export RUBY_CFLAGS="-march=native -O3"' >> ~/.profile"
  action :run
end

execute "export rbenv to PATH" do
  command "echo 'export PATH=\"$HOME/.rbenv/bin:$PATH\"' >> ~/.profile"
  action :run
end

execute "eval rbenv to profile" do
  command "echo 'eval \"$(rbenv init -)\"' >> ~/.profile"
  action :run
end

execute "reload shell" do
  command "exec $SHELL -l"
  action :run
end

execute "install ruby 2.0.0-p353" do
  command "rbenv install 2.0.0-p353"
  action :run
end

execute "set global ruby 2.0.0-p353" do
  command "rbenv global 2.0.0-p353"
  action :run
end

execute "rbenv rehash" do
  command "rbenv rehash"
  action :run
end