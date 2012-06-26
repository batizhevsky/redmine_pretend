require 'redmine'
require 'dispatcher'

require_dependency 'redmine_pretend/hooks'

RAILS_DEFAULT_LOGGER.info 'Starting Pretend plugin for RedMine'

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky'
  description 'Plugin to pretend selected user'
  version '0.0.2'
  url 'https://github.com/leonko/redmine_pretend'

  requires_redmine :version_or_higher => '0.9.0'
end

Dispatcher.to_prepare do
  require_dependency 'application_controller'
  require_dependency 'admin_controller'
  require_dependency 'user'

  ApplicationController.send(:include, PretendPatches::ApplicationControllerPatch)
  AdminController.send(:include, PretendPatches::AdminControllerPatch)
  User.send(:include, PretendPatches::UserPatch)
end
