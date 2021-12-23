Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api/v1' do
    resources :exchange, only: [:index]
    get '/exchange/compare', to: 'exchange#compare'
  end
end
