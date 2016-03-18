require 'redmine'

require_dependency 'redmine_pretend/hooks'

Rails.logger.info 'Starting Pretend plugin for RedMine'

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky'
  description 'Plugin to pretend selected user'
  version '2.0.1'
  url 'https://github.com/leonko/redmine_pretend'

  requires_redmine :version_or_higher => '2.0.0'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'redmine_pretend/application_controller_patch'
end
