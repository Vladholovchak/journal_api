Rails.application.routes.draw do
  resources :groups do
    resources :students
  end
end
