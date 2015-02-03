class Word < ActiveRecord::Base
  validates :word, :presence => true
  has_many :guesses
  before_save(:downcase)

  def letterize
    letters_array = []
    self.word.split("").each do |letter|
      letters_array.push(letter)
    end
    letters_array
  end


  def win?
    word_array = self.letterize.uniq
    guess_array =[]
    self.guesses.is_included.each do |guess|
      guess_array.push(guess.guess)
    end
    guess_array.sort == word_array.sort
  end

  private

  def downcase
    self.word=(word.downcase)
  end


end
