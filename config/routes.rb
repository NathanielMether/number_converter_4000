Rails.application.routes.draw do
  root 'number_converter#index'
  post '/' => 'number_converter#index'
end
