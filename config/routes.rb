ActionController::Routing::Routes.draw do |map|
  map.resources :projects
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
  map.resource :account, :controller => "users"
  map.resources :users
  map.login 'login', :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  map.register 'register', :controller => :users, :action => :new
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
