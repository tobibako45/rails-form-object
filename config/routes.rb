Rails.application.routes.draw do
  get 'contacts/index'
  get 'contacts/new'
  get 'contacts/create'
  # root "feedback#index"
  resources :feedbacks, only: %i(index new create)
  resources :contacts, only: %i(index new create)

  resources :orders do
    get :report, on: :menber
  end

end
