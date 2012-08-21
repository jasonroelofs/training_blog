TrainingBlog::Application.routes.draw do

  resources :blogs do
    resources :posts
  end

  root :to => "blogs#index"

end
