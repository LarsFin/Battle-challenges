require 'sinatra/base'
require_relative 'views/player'
require_relative 'views/game'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'sesh'

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_1_name = $game.player1.name
    @player_2_name = $game.player2.name
    @player_2_health = $game.player2.health
    @player_1_health = $game.player1.health
    erb(:play)
  end

  post '/names' do
    $game = Game.new(params[:player_1_name],params[:player_2_name])
    redirect '/play'
  end

  get '/attack' do
    @player_1_name = $game.player1.name
    @player_2_name = $game.player2.name
    $game.attack($game.player2)
    @player_2_health = $game.player2.health
    @player_1_health = $game.player1.health
    erb(:attack)
  end

  run! if app_file == $0
end
