name "base"
description "Base role applied to all nodes"

run_list(
	"recipe[apt]",
	"recipe[build-essential]",
	# "recipe[rbenv]",
	"recipe[sudo]",
	"recipe[git]",
	"recipe[chef-solo-search]",
	# "recipe[users::sysadmins]",

	"recipe[nginx]",
	"recipe[postgresql]",

	"recipe[nugen::setup_admin_users]",
	"recipe[nugen::install_nodejs]",
	"recipe[nugen::install_docsplit]",
	"recipe[nugen::install_rbenv]"
)

# override_attributes(
#   :apache2 => {
#     :prefork => { :min_spareservers => "5" }
#   },
#   :tomcat => {
#     :worker_threads => "100"
#   }
# )


  # "nginx": {
  #   "default_site_enabled": false,
  #   "workers": 4,
  #   "init_style": "init",
  #   "source": {
  #     "prefix": "/opt/nginx"
  #   }
  # }









# env_run_lists "name" => ["recipe[name]"], "environment_name" => ["recipe[name::attribute]"]
# default_attributes "node" => { "attribute" => [ "value", "value", "etc." ] }
# override_attributes "node" => { "attribute" => [ "value", "value", "etc." ] }
