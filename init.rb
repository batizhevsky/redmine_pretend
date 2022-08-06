require 'redmine'

Rails.logger.info 'Starting Pretend plugin for RedMine'

Redmine::Plugin.register :redmine_pretend do
  name 'Redmine Pretend plugin'
  author 'Leonid Batizhevsky'
  description 'Plugin to pretend selected user'
  version '3.0.0'
  url 'https://github.com/batizhevsky/redmine_pretend'

  requires_redmine :version_or_higher => '4.0.0'
end

require File.join(File.dirname(__FILE__), 'app/helpers/pretend_helper.rb')
require File.join(File.dirname(__FILE__), 'lib/redmine_pretend/application_controller_patch')
require File.join(File.dirname(__FILE__), 'lib/redmine_pretend/hooks')
