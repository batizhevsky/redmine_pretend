RedmineApp::Application.routes.draw do
  post 'admin/pretend_to/:id' => 'application#pretend_to', :as => 'pretend_to'
  post 'admin/unpretend' => 'application#unpretend', :as => 'unpretend'
end
