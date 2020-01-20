Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "restaurants#top"
  get 'list',       to: 'restaurants#top'
  post 'list',      to: 'restaurants#list'
  get 'detail/:id', to: 'restaurants#detail',as: 'detail'
end
