#
# Cookbook Name:: nginx
# Definition:: nginx_app
#
# Copyright 2008-2013, Opscode, Inc.
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

define :nginx_app, :template => 'nginx_app.conf.erb', :enable => true do

  application_name = params[:name]

  include_recipe 'nginx::default'

  template "#{node['nginx']['dir']}/sites-available/#{application_name}.conf" do
    source   params[:template]
    owner    'root'
    group    'root'
    mode     '0644'
    cookbook params[:cookbook] if params[:cookbook]
    variables(
      :application_name => application_name,
      :params           => params
    )
    if ::File.exists?("#{node['nginx']['dir']}/sites-enabled/#{application_name}.conf")
      notifies :reload, 'service[nginx]'
    end
  end

  site_enabled = params[:enable]
  nginx_site "#{params[:name]}.conf" do
    enable site_enabled
  end
end
