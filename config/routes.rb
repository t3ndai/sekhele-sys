Rails.application.routes.draw do
  get "inertia-example", to: "inertia_example#index"
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
      resources :benefit_elections, only: %i[index show destroy]
      get "benefits", to: "employee_benefits#index"
      get "benefits/:benefit_id", to: "employee_benefits#show_benefit", as: "benefit"
      get "benefits/:benefit_id/benefit_plans", to: "employee_benefits#show_benefit_plans", as: "benefit_benefit_plans"
      get "benefits/:benefit_id/benefit_plans/:benefit_plan_id", to: "employee_benefits#show_benefit_plan",
                                                                 as: "benefit_benefit_plan"
      post "benefits/:benefit_id/benefit_plans/:benefit_plan_id", to: "employee_benefits#elect_benefit_plan"
      resources :goals do
        resources :milestones
      end
      resources :one_to_ones do
            end
      resources :performance_review_responses
      resources :motivations
      resources :career_visions
      resources :talents
      resources :growth_areas
      resources :pulse_survey_responses, only: %i[index edit update show]
      get "home", to: "employee_dashboard#show"
      resources :agenda_items, only: %i[index create update]
      get "my_stuff", to: "my_stuff#index"
      get "my_career", to: "my_career#index"
      get "leave", to: "leave#index"
      get "reports", to: "reports#index"
      get "reports/:report_id/goals", to: "reports#goals"
      get "reports/:report_id/career", to: "reports#career"
      get "people", to: "people#index"
      resources :employee_jobs
      get "recruitment", to: "recruitment#index"
      get "recruitment/new_job", to: "recruitment#newjob"
      get "recruitment/candidate/:candidate_id", to: "recruitment#candidate", as: "recruitment_candidate"
      get "hr_admin", to: "hr_admin#index"
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
    resources :job_applicants, only: %i[index show destroy] do
      resources :interviews
      resources :candidate_notes, only: %i[index new show create destroy]
    end
    resources :interview_stages
    resources :interviews do
      resources :interviewers
      resources :interview_feedbacks
    end
    resources :performance_reviews
    resources :channels do
      member do
        post "join", as: :join
      end
      resources :channel_posts
      resources :praise_posts
    end
    resources :pulse_surveys
  end
  resources :tasks, only: %i[create update destroy]
  namespace :app_admin do
    resources :users
  end
  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  resources :sessions, only: %i[index show destroy]
  resource  :password, only: %i[edit update]
  namespace :identity do
    resource :email,              only: %i[edit update]
    resource :email_verification, only: %i[show create]
    resource :password_reset,     only: %i[new edit create update]
  end
  namespace :authentications do
    resources :events, only: :index
  end
  namespace :two_factor_authentication do
    namespace :challenge do
      resource :totp,           only: %i[new create]
      resource :recovery_codes, only: %i[new create]
    end
    namespace :profile do
      resource  :totp,           only: %i[new create update]
      resources :recovery_codes, only: %i[index create]
    end
  end
  resource :invitation, only: %i[new create]
  namespace :sessions do
    resource :sudo, only: %i[new create]
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
