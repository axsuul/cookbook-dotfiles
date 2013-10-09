#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2012, James Hu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install dependencies first so then we can overwrite any dotfiles
# that may have been created from them
include_recipe "vim"
include_recipe "tmux"
include_recipe "oh-my-zsh"
include_recipe "homesick"   # gives us homesick_castle resource

if node['instance_role'] == "vagrant"
  node.default['dotfiles']['users'] << "vagrant"
end

node['dotfiles']['users'].uniq.each do |user|
  castle = "dotfiles"
  castle_repo_path = "/home/#{user}/.homesick/repos/#{castle}"

  if File.exists?(castle_repo_path)
    # Reset hard the repo which will reset any uncommitted changes
    # so we can pull any changes from origin
    execute "reset dotfiles castle repo" do
      user user
      command "git reset --hard"
      cwd castle_repo_path
    end
  end

  homesick_castle castle do
    user user
    source "https://github.com/axsuul/dotfiles"
    action :update
  end
end
