Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dailies

  root 'dailies#showData'
  get 'casos', to: 'dailies#new'
  get 'edit', to: 'dailies#edit'
  get 'test', to: 'test#voidTest'
  
end
