Rails.application.routes.draw do

  root :to => 'static_pages#resume_builder'

  resources :companies

  resources :community_questions, path: '/community' do
    put :vote
    resources :community_answers, only: [:create] do
      put :vote
      get :all_comments, on: :member, format: :js
    end
  end

  resources :digital_cvs, path: '/digital-cvs' do
    member do
      patch :update_name
      post :save_personal_detail
      post :save_contact_detail

      get :share_and_download
      get :change_cv_template
      get :preview, to: 'digital_cvs#show'
    end
  end

  get '/digital-cvs/:id/edit/:slug', to: 'digital_cvs#edit'

  devise_for :users

  resources :messages, only: [:index, :create, :destroy]

  get '/about-us', to:'static_pages#about_us'
  get '/resume-builder', to:'static_pages#resume_builder'
  get '/contact-us', to:'static_pages#contact_us'
  get '/index', to:'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
