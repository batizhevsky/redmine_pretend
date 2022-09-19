RedmineApp::Application.routes.draw do
  post 'admin/pretend_to/:id' => 'pretend#create', as: 'pretend_to'
  post 'admin/unpretend' => 'pretend#delete', as: 'unpretend'
end
