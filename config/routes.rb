Rails.application.routes.draw do

  root :to => 'static_pages#resume_builder'

   resources :job_description_creators, only: [:new, :create] do
    collection do
      get :download
      post :save_responsibility

    end
  end

  resources :community_questions, path: '/community' do
    put :vote
    resources :community_answers, only: [:create] do
      put :vote
      get :all_comments, on: :member, format: :js
    end
  end

  resources :companies

  resources :digital_cvs, path: '/resumes' do
    member do
      patch :update_name
      post :save_photo
      post :save_personal_detail
      post :save_contact_detail

      get :share_and_download
      get :change_cv_template
      get :preview, to: 'digital_cvs#show'
    end
  end

  get '/resumes/:id/edit/:slug', to: 'digital_cvs#edit'
  get '/job_description_creators/new/:slug', to: 'job_description_creators#new'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :messages, only: [:create, :destroy]

  get '/job_description_creators/new/:slug', to: 'job_description_creators#new'
  get '/post-jobs', to:'static_pages#post_jobs'
  get '/about-us', to:'static_pages#about_us'
  get '/resume-builder', to:'static_pages#resume_builder'
  get '/contact-us', to:'static_pages#contact_us'
  get '/index', to:'static_pages#index'
  get '/states/:countrycode', to: 'static_pages#states'
  get '/cities/', to: 'static_pages#cities'

  %w(skill language degree specialization job_title).each do |item|
    post "/save_new_#{item}", to: "skills_and_languages#save_new_#{item}", format: :json
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
