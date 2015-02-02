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
end
