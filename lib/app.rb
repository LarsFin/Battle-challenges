require 'sinatra/base'
require_relative 'views/player'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'sesh'

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    @player_2_health = $player_2.health
    @player_1_health = $player_1.health
    erb(:play)
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/attack' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    $player_1.attack($player_2)
    @player_2_health = $player_2.health
    @player_1_health = $player_1.health
    erb(:attack)

  end

  run! if app_file == $0
end
