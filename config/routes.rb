Rails.application.routes.draw do
  get 'performance_imports/new'

  get 'welcome/index'

  resources :venues do
    collection { post :import }
  end

  resources :performance_imports

  shallow do
    resources :venues do
      resources :rooms do
        resources :performances
      end
    end
  end

  shallow do
    resources :shows do
      resources :performances
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
