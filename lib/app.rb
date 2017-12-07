require 'sinatra/base'
require 'views/player.rb'

class Battle < Sinatra::Base
  enable :sessions
  set :session_secret, 'sesh'

  get '/' do
    erb(:index)
  end

  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
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
  erb(:attack)
end

  run! if app_file == $0
end
