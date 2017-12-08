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
    @game = $game
    erb(:play)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1_name]),Player.new(params[:player_2_name]))
    redirect '/play'
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.inactive_player)
    redirect '/gameover' if @game.game_over?
    erb(:attack)
  end

  post '/attack' do
    @game = $game
    @game.switch
    redirect '/play'
  end

  get '/gameover' do
    @game = $game
    erb(:gameover)
  end

  run! if app_file == $0
end
