Rails.application.routes.draw do
  root 'status#index', defaults: { format: 'json' }

  scope :api, defaults: { format: 'json' } do
    resources :travel_logs, only: [:create, :show, :update]
  end
end
