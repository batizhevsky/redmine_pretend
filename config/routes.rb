ActionController::Routing::Routes.draw do |map|
  map.pretend_to_user 'admin/pretend/:id', :controller => 'admin', :action => 'pretend'
  map.pretend_off 'application/stop_pretend', :controller=>"application", :action=>"stop_pretend"
end
