Rails.application.routes.draw do
  root to: "challenge2#index"

  get 'winners', to: 'challenge2#winners'

  get 'call/my/APIs', to: 'call_my_apis#index'
  post 'call/my/APIs', to: 'call_my_apis#create'
  put 'call/my/APIs', to: 'call_my_apis#update'
  patch 'call/my/APIs', to: 'call_my_apis#update'
  delete 'call/my/APIs', to: 'call_my_apis#destroy'

  get 'call/my/apis', to: 'call_my_apis#case'
  get 'my/apis', to: 'call_my_apis#myapi'
  get 'my/APIs', to: 'call_my_apis#myapi'
  get 'something/something', to: 'call_my_apis#something'
  get 'hack/me/if/you/can', to: 'call_my_apis#title'
  get 'hackmeifyoucan', to: 'call_my_apis#title'
  get 'callmyAPIs', to: 'call_my_apis#think'

  get 'help/me/out', to: 'call_my_apis#clue1'
  get 'helpmeout', to: 'call_my_apis#clue11'
  get 'give/me/a/clue', to: 'call_my_apis#clue2'
  get 'givemeaclue', to: 'call_my_apis#clue21'
  get 'please', to: 'call_my_apis#clue22'
  get 'Please', to: 'call_my_apis#clue22'
  get 'please/give/me/a/clue', to: 'call_my_apis#clue3'
  get 'Please/give/me/a/clue', to: 'call_my_apis#clue3'
  get 'give/me/a/clue/please', to: 'call_my_apis#clue3'

  get 'winner_comments/:token', to: 'comments#new', as: 'comment'

  resources :c2_users, except: [:new, :edit]
  get 'c2_users/:id/hacker_apply', to: 'c2_users#apply', as: 'c2_users_apply'
  get 'c2_users/:id/:username', to: 'c2_users#show'

  match '*path', to: 'application#not_this_way', via: :all
end
