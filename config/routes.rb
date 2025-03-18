Rails.application.routes.draw do
  resources :organizations, shallow: true do
    resources :departments
    resources :employees do
      resources :employee_files
      resources :employee_managers
      resources :emergency_contacts
      resources :org_assets
      resources :leave_balances
      resources :leave_requests
      resources :time_workeds
      resources :benefit_elections, only: [ :index, :show, :destroy ]
      get "benefits", to: "employee_benefits#index"
      get "benefits/:benefit_id", to: "employee_benefits#show_benefit", as: "benefit"
      get "benefits/:benefit_id/benefit_plans", to: "employee_benefits#show_benefit_plans", as: "benefit_benefit_plans"
      get "benefits/:benefit_id/benefit_plans/:benefit_plan_id", to: "employee_benefits#show_benefit_plan", as: "benefit_benefit_plan"
      post "benefits/:benefit_id/benefit_plans/:benefit_plan_id", to: "employee_benefits#elect_benefit_plan"
      resources :goals do
        resources :milestones
      end
      resources :one_to_ones do
        resources :action_items
      end
      resources :performance_review_responses
      resources :personal_development_plans do
        resources :talents
        resources :motivations
        resources :career_visions
        resources :growth_areas
      end
    end
    resources :asset_categories
    resources :locations
    resources :cost_centers
    resources :job_functions do
      resources :job_levels
    end
    resources :documents
    resources :company_files
    resources :leave_categories
    resources :leave_policies
    resources :benefit_types
    resources :benefits do
      resources :benefit_plans
    end
    resources :job_postings
    get "jobs/", to: "jobs#index"
    get "jobs/:job_posting_id", to: "jobs#show", as: "job"
    get "jobs/:job_posting_id/apply", to: "job_applicants#new", as: "job_apply"
    post "jobs/:job_posting_id/apply", to: "job_applicants#create"
    resources :job_applicants, only: [ :index, :show, :destroy ] do
      resources :interviews
      resources :candidate_notes, only: [ :index, :new, :show, :create, :destroy ]
    end
    resources :interview_stages
    resources :interviews do
      resources :interviewers
      resources :interview_feedbacks
    end
    resources :performance_reviews
    resources :channels do
      resources :channel_posts
    end
  end
  namespace :app_admin do
    resources :users
  end
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: [ :index, :show, :destroy ]
  resource  :password, only: [ :edit, :update ]
  namespace :identity do
    resource :email,              only: [ :edit, :update ]
    resource :email_verification, only: [ :show, :create ]
    resource :password_reset,     only: [ :new, :edit, :create, :update ]
  end
  namespace :authentications do
    resources :events, only: :index
  end
  namespace :two_factor_authentication do
    namespace :challenge do
      resource :totp,           only: [ :new, :create ]
      resource :recovery_codes, only: [ :new, :create ]
    end
    namespace :profile do
      resource  :totp,           only: [ :new, :create, :update ]
      resources :recovery_codes, only: [ :index, :create ]
    end
  end
  resource :invitation, only: [ :new, :create ]
  namespace :sessions do
    resource :sudo, only: [ :new, :create ]
  end
  resources :performance_review_questions
  resources :performance_review_types
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
