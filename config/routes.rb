CesunAttendance::Application.routes.draw do
  get "shifts/index"

  get "shifts/show"

  get "shifts/new"

  get "shifts/edit"

  resources :shifts
  devise_for :users

  devise_scope :user do
    root :to => 'devise/sessions#new', :via => :get
  end

  resources :users, :only => [ :index, :edit, :update, :destroy ] do
    collection do
      get :role_list
    end
  end

  resources :study_plans
  resources :users, :only => :destroy
end
