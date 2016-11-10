Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images

  resources :ruby_chinas
  resources :topics

  resources :images do
    get 'preview_html' => 'images#preview_html'
  end

  get "/:user_id", to: 'ruby_chinas#user'
  get "/account/sign_in", to: 'ruby_chinas#sign_in'
  post "/account/sign_in", to: 'ruby_chinas#sign_in_post'
  get "*path", to: 'ruby_chinas#transfer'

  root 'ruby_chinas#index'
end
