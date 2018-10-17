require "sinatra/base"
require "shotgun"

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_one] = params[:player_one]
    session[:player_two] = params[:player_two]
    redirect to('/play')
  end

  get '/play' do
    @player_one = session[:player_one]
    @player_two = session[:player_two]
    erb(:play)
  end
  run! if app_file == $0 # run the overall application if this is the file we start the app from (as opposed to config)
end
