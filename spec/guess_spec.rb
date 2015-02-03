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
  describe ".is_included" do
    it "returns letters included in the word" do
      included_letter1 =Guess.create(guess: "a", included: true)
      included_letter2 =Guess.create(guess: "b", included: true)
      included_letters = [included_letter1, included_letter2]
      not_included_letter = Guess.create(guess:"c", included: false)
      expect(Guess.is_included()).to eq(included_letters)
    end
  end

  it("will downcase the guess") do
    guess = Guess.create(guess: "H")
    expect(guess.guess()).to eq("h")
  end

  it("ensures the length of the guess is one character") do
    guess = Guess.new(guess: "he")
    expect(guess.save).to eq(false)
  end

  it("only allows the user to enter a letter not already guessed") do
    guess1 = Guess.create(guess: "h")
    guess2 = Guess.new(guess: "h")
    expect(guess2.save).to eq(false)
  end

end
