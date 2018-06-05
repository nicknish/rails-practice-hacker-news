Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"

  resources :posts do
    member do
      patch 'upvote', to: 'posts#upvote'
      patch 'downvote', to: 'posts#downvote'
    end
  end
end
