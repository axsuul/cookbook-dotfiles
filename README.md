Description
===========

For cooking my yummy dotfiles gourmet style.

Attributes
==========

    default['dotfiles']['users'] = []

*Note: Will automatically install for `vagrant` user if it's detected we are running within a vagrant virtual machine.*

Usage
=====
Always put this last in the run list so it dominatrixes any dotfiles placed by other cookbooks.

    recipe[dotfiles]