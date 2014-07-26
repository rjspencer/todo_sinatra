require 'open-uri'

# class Card
#   attr_reader :definition, :answer
#   def initialize(info)
#     @definition = info.fetch(:definition, nil)
#     @answer = info.fetch(:answer, nil)
#   end
# end

##########################

class Game
  attr_reader :round_cards, :answer, :cards

  def initialize
    @cards = []
    # create_cards('model/flashcard_samples.txt')
    # @wrong_answers = create_wrong_answers('model/wrong_answers.txt')
    @round_cards = []
    @answer = ""
    create_cards('flashcard_samples.txt')
    @wrong_answers = create_wrong_answers('wrong_answers.txt')
  end

  def file_to_array(file)
    File.open(file).map do |line|
        line.gsub("\n", "")
    end
  end

  def create_cards file
    card = {}
    file_to_array(file).each_with_index do |row, index|
      # p index % 3
      if index % 3 == 0
        card[:definition] = row
      elsif index % 3 == 1
        card[:answer] = row
        p card
      end
      @cards << card
    end
    p @cards
  end

  def create_wrong_answers file
    file_to_array(file).map! do |line|
      line
    end
  end

  def new_correct_card
    @cards.sample
  end

  def new_wrong_answer
    @wrong_answers.sample
  end

  def new_round
    @round_cards = []
    @round_cards << new_correct_card
    3.times do
      @round_cards << { answer: new_wrong_answer, definition: false}
    end
    set_answer
    @round_cards.shuffle!
  end

  def set_answer
    @cards.each do |card|
      @answer = card[:answer] if card[:answer] != false
    end
  end

  # def display_all_cards
  #   @round_cards.each { |card| display_card(card) }
  # end

  # def display_card(card)
  #   p card
    # display = "<span class='card text-center col-3'>"
    # display << "<img id='image1' class='flashcard col-3 img-responsive img-circle' src='http://www.allaboutbirds.org/guide/PHOTO/LARGE/bobo_kurtkirchmeier2.jpg'><br>"
    # display << "<a href='/" + @answer + "/" card[:answer]+ "><button type='button' class='btn btn-success'>" + card[:answer] + "</button><br></a>"
    # display << "<p class='text-muted text-center hide'>#{card[0][:definition]}</p>"
    # display << "</span>"
  # end

  # def verify_input(input, answer)
  #   input.downcase == answer.downcase
  # end
end

###############################
# DRIVER

game = Game.new
game.new_round
p game.round_cards[2][:answer]
p game.round_cards[2][:definition]
p game.answer
game.new_round
p game.round_cards[2][:answer]
p game.round_cards[2][:definition]
p game.answer
# p game.cards



