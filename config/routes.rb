Rails.application.routes.draw do
  get 'welcome/index'
  get 'performance_imports' => 'performance_imports#new'

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

  resources :performance_imports, only: %i[new create]

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
