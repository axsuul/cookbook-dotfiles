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

gem_package "dotify" do
  version "0.6.6"
end

node['dotfiles']['users'].each do |username|
  home_path = "/home/#{username}"
  dotify_path = "#{home_path}/.dotify"
  
  if File.exists? dotify_path
    sync_action = :sync
  else
    execute "install dotfiles" do
      cwd home_path
      command "dotify github axsuul/dotfiles"
      creates dotify_path
      action :run
      notifies :sync, "git[#{dotify_path}]", :immediately
    end

    sync_action = :nothing
  end

  # execute "update dotfiles" do
  #   cwd dotify_path
  #   command "git pull"
  # end

  execute "update dotfiles" do
    cwd home_path
    command "dotify unlink --force && dotify link --force"
    action :nothing
  end

  git dotify_path do
    action sync_action
    notifies :run, "execute[update dotfiles]", :delayed  # run at the end so it overwrites
  end
end