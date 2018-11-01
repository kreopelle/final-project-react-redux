Rails.application.routes.draw do

  namespace :api do
    resources :sounds, except: [:new, :edit]
  end

end
