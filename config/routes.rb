Rails.application.routes.draw do
  root 'crickets#index'
  #resources :analytics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :crickets do
  	put :vote
  end

  resources :footballs do
  	put :vote
  end	
end
