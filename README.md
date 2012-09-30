Description
===========

For cooking my yummy dotfiles gourmet style.

Attributes
==========

    default['dotfiles']['users'] = []

*Note: Will automatically install for `vagrant` user if it's detected we are running within a vagrant virtual machine.*

Usage
=====
Put this in your run list

    recipe[dotfiles]

Also depends on these cookbooks

- vim
- oh-my-zsh
- tmux
- [homesick](https://github.com/fnichol/chef-homesick)