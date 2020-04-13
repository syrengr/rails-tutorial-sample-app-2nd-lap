Rails.application.routes.draw do
  get 'static_paegs/home'

  get 'static_paegs/help'

  root 'application#hello'
end
