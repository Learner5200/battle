require "sinatra/base"
require "./lib/player"
require "./lib/game"

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player_one = Player.new(params[:player_one])
    $player_two = Player.new(params[:player_two])
    $game = Game.new
    redirect to('/play')
  end

  get '/play' do
    @player_one_name = $player_one.name
    @player_two_name = $player_two.name
    @player_one_hp = $player_one.hp
    @player_two_hp = $player_two.hp
    @attacked = $game.just_attacked?
    erb(:play)
  end

  post '/attack' do
    $game.attack($player_two)
    redirect to('/play')
  end

  run! if app_file == $0 # run the overall application if this is the file we start the app from (as opposed to config). I think the idea is if we find this line while running config, then $0 will be config.ru and the condition will be false.
end
