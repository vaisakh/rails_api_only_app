Rails.application.routes.draw do

  api_version(:module => "V1", :path => {:value => "v1"}) do
    constraints subdomain: 'api' do

      # common
      #post 'auth/register',   to: 'users#register'
      post 'auth/login', to: 'users#login'
      get 'test', to: 'users#test'

      # user
      get 'user/list', to: 'users#list'
      get 'user/info', to: 'users#info'
      post 'user/update', to: 'users#update'
      delete 'user/delete', to: 'users#delete'

      #account
      post 'account/register', to: 'accounts#create'
    end
  end

  root to: proc { [404, {}, ["Unauthorized"]]  }
  get '*unmatched_route', to: proc { [404, {}, ["Unauthorized"]]   }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
