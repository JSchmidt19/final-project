Rails.application.routes.draw do
    
    
    
  get 'users/new'

  get 'sessions/new'

    get '/pots/:style' => 'pots#index', as: 'pottery', constraints: { style: /[0-9]+/ }
        
    get '/pots/:id/:style' => 'pots#show', as: 'show_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/pots/edit/:id/:style' => 'pots#edit', as: 'edit_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    get '/pots/new/:id/:style' => 'pots#new', as: 'new_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    
    get '/pot_images/:style' => 'pot_images#index', as: 'pot_images_style', constraints: { style: /[0-9]+/ }
        
    get '/pot_images/:id/:style' => 'pot_images#show', as: 'show_pot_image_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/pot_images/edit/:id/:style' => 'pot_images#edit', as: 'edit_pot_image_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    get '/pot_images/new/:style' => 'pot_images#new', as: 'new_pot_image_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/pot_images/add/:id/:style' => 'pot_images#add', as: 'add_pot_image', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
        get '/pots/buy/:style' => 'pots#buy', as: 'buy_pot', constraints: {style: /[0-9]+/}

    get '/pots/buy/:id/:style' => 'pots#buy', as: 'buy_pot_individual', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    

    
    get '/facts/:style' => 'facts#index', as: 'errata', constraints: { style: /[0-9]+/ }
        
    get '/facts/:id/:style' => 'facts#show', as: 'show_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/facts/edit/:id/:style' => 'facts#edit', as: 'edit_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    get '/facts/new/:style' => 'facts#new', as: 'new_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
  
    
    get 'calculator/new/:style' => 'calculator#new'
    get 'pots/search/:style' => 'pots#search'    
    get 'facts/search/:style' => 'facts#search'

    
    
    
    
    
    
   get "index" => redirect("index/1"), as: 'redirect_index'
   get "calculator" => redirect("calculator/1"), as: 'redirect_calc'
   get "calculator/about" => redirect("calculator/about/1"), as: 'redirect_calc_about'
   get "main/about" => redirect("main/about/1"), as: 'redirect_about'
   get "main/contact" => redirect("main/contact/1"), as: 'redirect_contact'
   get "main/login" => redirect("main/login/1"), as: 'redirect_login'
   #get "fractal/index" => redirect("fractal/index/1"), as: 'redirect_fract_index'
   #get "fractal/login" => redirect("fractal/login/1"), as: 'redirect_fract_login'
    
    
    get "pots" => redirect("pots/1"), as: 'redirect_pot'
    get "pot_images" => redirect("pot_images/1"), as: 'redirect_pot_image'
    get "facts" => redirect("facts/1"), as: 'redirect_fact'
    

    
    
    
    
      root :to => "main#index", style: 1
    
    
    resources :main
    resources :fact_tags
  resources :tags
  resources :facts
  resources :pot_images
    resources :pots
    
    get '/:style', to: 'main#index', constraints: { style: /[0-9]+/ }
    
    get '/index/:style' => 'main#index', as: 'index', constraints: { style: /[0-9]+/ }
    
    get '/about/:style' => 'main#about', as: 'about', constraints: { style: /[0-9]+/ }
    
    get '/contact/:style' => 'main#contact', as: 'contact', constraints: { style: /[0-9]+/ }
    
    get '/login/:style' => 'main#login', as: 'login_main', constraints: { style: /[0-9]+/ }
    
    get '/calculator/:style' => 'calculator#index', as: 'calculator', constraints: { style: /[0-9]+/ }
    
    

    #get "fractal/index/:style" => 'fractal#index', as: 'fract_index'
   #get "fractal/login/:style" => 'fractal#login', as: 'fract_login'


    
    get '/calculator/about/:style' => 'calculator#about', as: 'calculator_faq', constraints: { style: /[0-9]+/ }
    
    get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
    
    post '/lgin' => redirect("/login"), to: 'sessions#new', as: 'lgin'
    

    get '/logtwo', to: 'sessions#loginsecondary', as: 'login_two'
    post '/logtwo', to: 'sessions#loginsecondary'
    
    
    get '/fractal' => 'sessions#fractal', as: 'fractal_login'
    
    
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'
  resources :users
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
