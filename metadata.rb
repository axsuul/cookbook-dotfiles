maintainer       "James Hu"
maintainer_email "axsuul@gmail.com"
license          "Apache 2.0"
description      "Cooks up dotfiles."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "default", "Installs dotfiles"

%w{ubuntu debian}.each do |os|
  supports os
end