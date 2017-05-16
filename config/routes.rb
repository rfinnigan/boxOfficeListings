Rails.application.routes.draw do
  get 'welcome/index'

  shallow do
    resources :venues do
      resources :rooms do
        resources :shows do
          resources :performances
        end
      end
    end
  end
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
