maintainer       "Cramer Development, Inc."
maintainer_email "sysadmin@cramerdev.com"
license          "Apache 2.0"
description      "Installs/Configures backup"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.2.0"

depends 'rightscale'

%w{ ubuntu debian redhat centos scientific }.each do |os|
  supports os
end

recipe "backup::default", "Installs the backup gem"