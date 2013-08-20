if Rails::VERSION::MAJOR >= 3
  RedmineApp::Application.routes.draw do
    match 'admin/pretend_to/:id' => 'application#pretend_to', :as => 'pretend_to'
    match 'admin/unpretend' => 'application#unpretend', :as => 'unpretend'
  end
else
  ActionController::Routing::Routes.draw do |map|
    map.pretend_to 'admin/pretend_to/:id', :controller => 'application', :action => 'pretend_to'
    map.unpretend 'admin/unpretend', :controller => 'application', :action => 'unpretend'
  end
end
