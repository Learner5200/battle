require "sinatra/base"
require "./lib/player"
require "./lib/game"
require "./lib/attacker"

class Battle < Sinatra::Base
  # enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_one = Player.new(params[:player_one])
    player_two = Player.new(params[:player_two])
    $game = Game.new(player_one, player_two, Attacker.new)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  post '/attack' do
    $game.attacker.attack($game.current_target)
    if $game.complete?
      redirect to('/complete')
    else
      redirect to('/play')
    end
  end

  post '/switch' do
    $game.switch_player
    redirect to('/play')
  end

  get '/complete' do
    @game = $game
    erb(:complete)
  end

  run! if app_file == $0 # run the overall application if this is the file we start the app from (as opposed to config). I think the idea is if we find this line while running config, then $0 will be config.ru and the condition will be false.
end
