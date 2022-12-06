Rails.application.routes.draw do
  root 'lab#input'
  post '/lab/result'
  post '/result', to: 'lab#result'
end
