require 'sinatra/base'
require './lib/cell.rb'
require './lib/board.rb'
require './lib/player.rb'
require './lib/checker.rb'
require './lib/game.rb'



class App < Sinatra::Base
enable :sessions

@@number_of_players = 0

@@game = Game.new


get '/' do
	erb :index
end

post '/sign_up' do
	redirect '/' if (params[:player_name]).nil?
	session[:player_name] = params[:player_name]
	@@game.add_player(params[:player_name])
	@@number_of_players +=1
	redirect '/lobby'
end

get '/lobby' do
	redirect '/' if session[:player_name].nil?
	@number_of_players = @@number_of_players
	erb :lobby
end

get "/reset_game" do
	session.clear
	@@number_of_players = 0
	@@game = Game.new #need to figure out how to delete players?
	redirect '/'
end

get "/game" do
	redirect '/' if @@number_of_players !=2
	@game=@@game
	erb :game
end

post "/game" do
	redirect '/' if @@number_of_players !=2
	@@game.player_mark(session[:player_name], params[:cell_to_fill].to_i)
	redirect '/game'
end


end