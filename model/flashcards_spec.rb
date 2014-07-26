#rspec
require_relative 'flashcards'

describe 'Game' do
  describe "#Game.new" do
    it 'should create an new instance of Game class' do
      (game = Game.new)
      expect(game).to be_a_kind_of(Game)
    end
  end

  describe "#Game.create_wrong_answers" do
    it 'returns a string' do
      (game = Game.new)
      expect(game.new_wrong_answer).to be_a_kind_of(String)
    end
  end

end
