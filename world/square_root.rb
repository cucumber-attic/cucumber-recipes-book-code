# START:root
require 'sinatra'

get '/' do
  <<HERE
<!DOCTYPE html>
<html>
  <head>
    <title>Square root</title>
  </head>
  <body>
    Enter a number to take the square root:
    <form action="/square_root">
      <input name="number" type="text">
      <input name="submit" type="submit">
    </form>
  </body>
</html>
HERE
end
# END:root

# START:result
get '/square_root' do
  number = params[:number].to_f
  result = Math.sqrt(number)

  <<HERE
<!DOCTYPE html>
<html>
  <head>
    <title>Result</title>
  </head>
  <body>
    The square root of <span id="number">#{number}</span>
    is <span id="result">#{result}</span>.
  </body>
</html>
HERE
end
# END:result

# START:api
get '/api/square_root/:n' do |n|
  Math.sqrt(n.to_f).to_s
end
# END:api
