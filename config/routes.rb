Rails.application.routes.draw do
  namespace :api do
    resource :sound, except: [:new, :edit]
  end
end
