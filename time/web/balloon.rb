require 'sinatra'

enable :sessions

get '/inflate' do
  session[:start] = Time.now
  redirect to('/status')
end

get '/status' do
  now = Time.now
  elapsed = now - (session[:start] || now)
  elapsed >= 5 ? 'Popped!' : 'Inflating'
end
