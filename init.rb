Rails.logger.info 'Starting Pretend plugin'

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky (orig)'
  description 'Plugin to pretend selected user'
  version '3.0.1'
  url 'https://github.com/tools-aoeur/redmine_pretend'

  requires_redmine version_or_higher: '4.0.0'
end

require_relative 'app/helpers/pretend_helper'
require_relative 'lib/redmine_pretend/application_controller_patch'
require_relative 'lib/redmine_pretend/hooks'
