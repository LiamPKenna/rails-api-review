Rails.application.routes.draw do
  resources :finishes
  resources :quizzes do
    resources :questions do
      resources :answers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
