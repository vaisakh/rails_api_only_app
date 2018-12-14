class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?  || request.subdomain == 'public'
  end
end

Rails.application.routes.draw do
  api_version(:module => "V", :path => {:value => "api/internal"}) do

    constraints(SubdomainPresent) do
      #post 'auth/register',   to: 'users#register'
      post 'auth/login', to: 'users#login'
      get 'test', to: 'users#test'

      # user
      get 'user/list', to: 'users#list'
      get 'user/info', to: 'users#info'
      post 'user/update', to: 'users#update'
      delete 'user/delete', to: 'users#delete'

      #survey
      get 'survey/list', to: 'survey#list'
      get 'survey/info', to: 'survey#info'
      post 'survey/create', to: 'survey#create'
      delete 'survey/delete', to: 'survey#delete'
    end

    constraints(SubdomainBlank) do
      post 'account/register', to: 'accounts#create'
    end
  end

  root to: proc { [404, {}, ["Unauthorized"]]  }
  get '*unmatched_route', to: proc { [404, {}, ["Unauthorized"]]   }
end
