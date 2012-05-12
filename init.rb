require 'redmine'
require 'dispatcher'

require 'application_controller_patch'
require 'admin_controller_patch'
require_dependency 'redmine_pretend/hooks'

RAILS_DEFAULT_LOGGER.info 'Starting Pretend plugin for RedMine'

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky'
  description 'Plugin to pretend selected user'
  version '0.0.1'
  url 'https://github.com/leonko/redmine_pretend'

  requires_redmine :version_or_higher => '0.9.0'
end

#Dispatcher.to_prepare do
  #ApplicationController.send(:include, Patches::ApplicationControllerPatch)
  #AdminController.send(:include, Patches::AdminControllerPatch)
#end
