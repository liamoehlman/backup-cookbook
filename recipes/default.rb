#
# Cookbook Name:: backup
# Recipe:: default
#
# Copyright 2011-2012, Cramer Development, Inc.
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
rightscale_marker :begin

# gem_package 'backup' do
#   version node['backup']['version']
# end

# node['backup']['dependencies'].each do |gem, ver|
#   gem_package gem do
#     version ver if ver && ver.length > 0
#   end
# end
package "libxml2-dev" do
  action :install
end

package "libxslt1-dev" do
  action :install
end

gem_package "backup" do
  gem_binary "/usr/bin/gem1.9.1"
  version "3.0.25"
end

gem_package "fog" do
  gem_binary "/usr/bin/gem1.9.1"
  version "1.4.0"
end

%w[ config_path model_path ].each do |dir|
  directory node['backup'][dir] do
    owner node['backup']['user']
    group node['backup']['group']
    mode '0700'
  end
end

template "#{node['backup']['config_path']}/config.rb" do
  source 'config.rb.erb'
  owner node['backup']['user']
  group node['backup']['group']
  mode '0600'
end

rightscale_marker :end
