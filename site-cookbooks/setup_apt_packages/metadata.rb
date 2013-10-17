name             "setup_apt_packages"
maintainer       "nugen"
maintainer_email "nguyen.david89@gmail.com"
description      "updates system packages"
version          "1.0"
recipe           "setup_apt_packages", "Recipe that updates system packages"

%w{ ubuntu debian redhat centos fedora freebsd}.each do |os|
  supports os
end