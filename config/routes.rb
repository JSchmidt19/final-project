Rails.application.routes.draw do
  get 'fractal/index'

  get 'fractal/login'
    
  root 'fractal#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
