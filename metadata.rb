name             "dotfiles"
maintainer       "James Hu"
maintainer_email "axsuul@gmail.com"
license          "Apache 2.0"
description      "Cooks up dotfiles."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends "vim"
depends "tmux"
depends "oh-my-zsh"
depends "homesick"

recipe "default", "Installs dotfiles"

supprts "ubuntu"
supprts "debian"