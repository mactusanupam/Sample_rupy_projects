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

  resources :jobs do
    collection do
      get :job_application_update
      post :job_application_update
      get :job_application
    end
    member do
      post :apply
      get :job_applied
      patch :job_status_update
    end
  end

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

  get "/ecv/:slug", to: 'digital_cvs#online_resume', format: [:html, :pdf]
  get '/resumes/:id/edit/:slug', to: 'digital_cvs#edit'
  get '/resume-templates', to: 'digital_cvs#new'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :messages, only: [:create, :destroy]

  %w(about-us resume-builder contact-us index cities).each do |act|
    get "/#{act}", to: "static_pages##{act.gsub('-', '_')}"
  end

  get '/post-jobs', to:'static_pages#post_jobs'
  get '/states/:countrycode', to: 'static_pages#states'
  get '/resumes-plans-pricing/:digital_cv_id', to: 'static_pages#resumes_plans_pricing'

  %w(skill language degree specialization job_title).each do |item|
    post "/save_new_#{item}", to: "skills_and_languages#save_new_#{item}", format: :json
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
