Rails.application.routes.draw do

  root   'weather#index'
  post   'outfit'   => 'weather#createoutfit'

end
