MoodMixer::Application.routes.draw do

  root 'site#index'

  get     'login'   => 'session#new'
  post    'login'   => 'session#create'
  delete  'logout'  => 'session#destroy'
  get     'register'=> 'session#registration'
  post    'register'=> 'session#register'
  # get     'logout'  => 'session#destroy' # TODO: remove before deployment

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'tag' => 'music#new'
  post 'tag' => 'music#create'

  post 'list' => 'music#list'

  get 'stats' => 'stats#chart'

end
