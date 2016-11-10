Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images

  resources :images do
    get 'preview_html' => 'images#preview_html'
  end
end
