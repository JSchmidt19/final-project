Rails.application.routes.draw do
  get 'calculator/index'

  get 'calculator/about'

  get 'main/index'

  get 'main/about'

  get 'main/contact'

  get 'main/login'

  get 'fractal/index'

  get 'fractal/login'
    
  root :to => "main#root", :style => '1'
    
    resources :main
    
    get '/index/:style' => 'main#index', as: 'index'
    
    get '/about/:style' => 'main#about', as: 'about'
    
    get '/contact/:style' => 'main#contact', as: 'contact'
    
    get '/login/:style' => 'main#login', as: 'login'
    
    get '/calculator/:style' => 'calculator#index', as: 'calculator'
    
    get '/calculator/about/:style' => 'calculator#about', as: 'calculator_faq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
