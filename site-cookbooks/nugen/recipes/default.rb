include_recipe "nugen::setup_admin_users"
include_recipe "nugen::update_packages"
# include_recipe "nugen::install_irb"
# include_recipe "nugen::copy_dotfiles"
# include_recipe "nugen::set_timezone"
include_recipe "nugen::install_nodejs" # Need a javascript runtime
# include_recipe "nugen::set_up_postgres_hstore"
# include_recipe "nugen::install_mongodb"
# include_recipe "nugen::install_memcached"
# include_recipe "nugen::install_monit"
# include_recipe "nugen::firewall"