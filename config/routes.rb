Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :players
      resources :games
      resources :rounds
      resources :answers
    end
  end
end
