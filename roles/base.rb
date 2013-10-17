name "base"
description "Base role applied to all nodes"
run_list(
	"recipe[apt]",
	# "recipe[setup_apt_packages]",
	"recipe[build-essential]",
	"recipe[git]",
	"recipe[chef-solo-search]",
	"recipe[users::sysadmins]",
	"recipe[sudo]"


	
	# "recipe[nugen::install_rbenv]",
	# "recipe[nugen::install_nodejs]"
)