Rails.application.routes.draw do

  # new
  get 'posts/new' => "posts#new", as: :new_post

  # create
  post "/posts" => "posts#create"

  # index
  root "posts#index"
  get '/posts/index', as: :posts_index

  # edit
  get '/posts/:id/edit', {to: 'posts#edit', as: :edit_post}

  # show
  get 'posts/:id' => "posts#show", as: :post

  #update action handles the submission of form from the post#edit page
  patch '/posts/:id', {to: 'posts#update'}

  #delete action route
  delete '/posts/:id', { to: 'posts#destroy' }

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # # # index
  # # get 'products' => "products#index"
  # # get '/questions/:id', {to: "questions#show", as: :question}
  # # match '/home',  to: 'pages#home',            via: 'get'
  # # match '/about',  to: 'pages#about',            via: 'get'
  # # match '/contact_us',  to: 'pages#contact_us',      via: 'get'
  # # root to: 'pages#home'
  # # root 'pages#home'
  # # controller :products do
  # #   # get :new
  # #   # get :index
  # #   # post "/products" => "products#create", as: :products
  # # end

  # controller :pages do
  #   get :home
  #   get :about
  #   get :contact_us
  #   get :bill_splitter
  #   post :bill_splitter
  # end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
