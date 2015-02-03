require("spec_helper")

describe(Word) do
  it("validates the presence of a word") do
    test_word = Word.new(word: "")
    expect(test_word.save()).to(eq(false))
  end

  it {should have_many (:guesses)}

  describe "#letterize" do
    it("returns an array of letters for each word")  do
      test_word = Word.create(word: "hello")
      expect(test_word.letterize()).to eq(["h","e", "l", "l", "o"])
    end
  end

  it("will downcase the word") do
    word = Word.create(word: "HELLO")
    expect(word.word()).to eq("hello")
  end

  describe("#win?") do
    it("returns true if the player has won the game") do
      word = Word.create(word: "matt")
      guess1= Guess.create(guess: "a", word_id: word.id, included: true)
      guess2= Guess.create(guess: "m", word_id: word.id, included: true)
      guess3= Guess.create(guess: "t", word_id: word.id, included: true)
      expect(word.win?).to eq(true)
    end
  end
end
