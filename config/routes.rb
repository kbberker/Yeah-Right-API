Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :players
      resources :games
      resources :rounds
      resources :answers
      post '/games_players', to: 'players#games_players'
    end
  end
end
