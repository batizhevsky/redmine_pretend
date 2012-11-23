require 'redmine'
require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

require_dependency 'redmine_pretend/hooks'

if Rails::VERSION::MAJOR >= 3
  Rails.logger.info 'Starting Pretend plugin for RedMine'
else
  RAILS_DEFAULT_LOGGER.info 'Starting Pretend plugin for RedMine'
end

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky'
  description 'Plugin to pretend selected user'
  version '0.0.3'
  url 'https://github.com/leonko/redmine_pretend'

  requires_redmine :version_or_higher => '0.9.0'
end

if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    require_dependency 'redmine_pretend/application_controller_patch'
  end
else
  Dispatcher.to_prepare do
    require_dependency  'redmine_pretend/application_controller_patch'
  end
end
