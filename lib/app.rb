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
    $game = Game.new(params[:player_1_name],params[:player_2_name])
    redirect '/play'
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.player2)
    erb(:attack)
  end

  run! if app_file == $0
end
