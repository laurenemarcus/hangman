require("spec_helper")

describe Guess do
  it {should belong_to (:word)}
  it "validate the presence of a guess" do
    guess = Guess.new(guess: "")
    expect(guess.save()).to eq(false)
  end

  describe ".not_included" do
    it "returns letters not included in the word" do
      not_included_letter1 =Guess.create(guess: "a", included: false)
      not_included_letter2 =Guess.create(guess: "b", included: false)
      not_included_letters = [not_included_letter1, not_included_letter2]
      included_letter = Guess.create(guess:"c", included: true)
      expect(Guess.not_included()).to eq(not_included_letters)
    end
  end
end
