Rails.application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}) do
    constraints subdomain: 'api' do
      post 'auth/register',   to: 'users#register'
      post 'auth/login', to: 'users#login'
      get 'test', to: 'users#test'
      get 'user/list', to: 'users#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
