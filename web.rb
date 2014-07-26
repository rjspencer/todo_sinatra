require 'rubygems'
require 'sinatra'
require 'json'
require_relative 'model/flashcards.rb'

game = Game.new
@result = ""
####################################################
# URL HANDLING
####################################################

get '/' do
  game.new_round
  @cards = game.round_cards
  @answer = game.answer
  erb :index
end

get '/:answer/:choice' do
  if params[:choice] == params[:answer]
    @result = "Correct!"
  else
    @result = "The correct answer was #{params[:answer]}!"
  end
  game.new_round
  @cards = game.round_cards
  @answer = game.answer
  erb :index
end


