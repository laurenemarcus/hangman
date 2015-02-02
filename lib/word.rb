class Word < ActiveRecord::Base
  validates :word, :presence => true
  has_many :guesses

  def letterize
    letters_array = []
    self.word.split("").each do |letter|
      letters_array.push(letter)
    end
    letters_array
  end

end
