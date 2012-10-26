require 'sinatra'

get '/inflate' do
  IO.read 'inflate.html'
end
