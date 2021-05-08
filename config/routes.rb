Rails.application.routes.draw do

  root 'dig_top#home'
  get 'dig_home/dighome'
  get 'dig_home/dig_index'
  get 'dig_top/setumei'


  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users

  resource :profiles

  resources :users do
    resources :tasks, only: %i(index)
  end
  
  resources :endshow, only: %i(index)
  resources :chat_rooms, only: %i(index,destroy)

  resources :tasks do
    resources :chat_rooms, only: %i(index create)
    resources :work_schedules #resource 単数でｉｄを作らない
    resource :done, only: %i(index update)
  end
end

