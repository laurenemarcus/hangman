class Guess < ActiveRecord::Base
  validates :guess, {:presence => true, :length => {:maximum => 1}, :uniqueness => true}
  belongs_to :word
  scope(:not_included, ->do where({:included =>false})end)
  scope(:is_included, ->do where({:included =>true})end)
  before_save(:downcase)




private
  def downcase
    self.guess=(guess.downcase)
  end


end
