Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root           to: 'links#new'
  post '/',      to: 'links#create'
  get  '/:slug', to: 'links#show'
end
