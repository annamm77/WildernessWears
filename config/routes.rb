Rails.application.routes.draw do

  root   'weather#index'
  post   'outfit'   => 'weather#create_outfit'

end
