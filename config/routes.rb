Rails.application.routes.draw do

  root :to => 'static_pages#resume_builder'

  resources :messages, only: [:index, :create, :destroy]
  resources :companies
  resources :digital_cvs, path: '/digital-cvs' do
    member do
      patch :update_cv_name
      post :save_personal_detail
      post :save_contact_detail
    end
  end
  devise_for :users

  get '/about-us', to:'static_pages#about_us'
  get '/resume-builder', to:'static_pages#resume_builder'
  get '/contact-us', to:'static_pages#contact_us'
  get '/index', to:'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
