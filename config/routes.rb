Rails.application.routes.draw do
    
    
    get '/pots/:style' => 'pots#index', as: 'pottery', constraints: { style: /[0-9]+/ }
        
    get '/pots/:id/:style' => 'pots#show', as: 'show_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/pots/edit/:id/:style' => 'pots#edit', as: 'edit_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    get '/pots/new/:id/:style' => 'pots#new', as: 'new_pot_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}

    
    get '/facts/:style' => 'facts#index', as: 'errata', constraints: { style: /[0-9]+/ }
        
    get '/facts/:id/:style' => 'facts#show', as: 'show_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    get '/facts/edit/:id/:style' => 'facts#edit', as: 'edit_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
    get '/facts/new/:id/:style' => 'facts#new', as: 'new_fact_style', constraints: {style: /[0-9]+/, id: /[0-9]+/}
    
  
    
    get 'calculator/new/:style' => 'calculator#new'
    
    
    
    
    
   get "index" => redirect("index/1"), as: 'redirect_index'
   get "calculator" => redirect("calculator/1"), as: 'redirect_calc'
   get "calculator/about" => redirect("calculator/about/1"), as: 'redirect_calc_about'
   get "main/about" => redirect("main/about/1"), as: 'redirect_about'
   get "main/contact" => redirect("main/contact/1"), as: 'redirect_contact'
   get "main/login" => redirect("main/login/1"), as: 'redirect_login'
   get "fractal/index" => redirect("fractal/index/1"), as: 'redirect_fract_index'
   get "fractal/login" => redirect("fractal/login/1"), as: 'redirect_fract_login'

    
    
    
    
  root :to => "main#index", style: '1'
    
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
    
    get '/login/:style' => 'main#login', as: 'login', constraints: { style: /[0-9]+/ }
    
    get '/calculator/:style' => 'calculator#index', as: 'calculator', constraints: { style: /[0-9]+/ }
    
    

    


    
    get '/calculator/about/:style' => 'calculator#about', as: 'calculator_faq', constraints: { style: /[0-9]+/ }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
