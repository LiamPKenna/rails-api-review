Rails.application.routes.draw do
  resources :quizzes do
    resources :questions do
      
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
