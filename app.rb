require("bundler/setup")
Bundler.require(:default)
require 'pry'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file}

get '/' do
  @words = Word.all
  erb(:index)
end

post '/words' do
  word = params.fetch("word")
  Word.create({:word => word })
  redirect '/'
end

delete '/' do
  @words = Word.all
  @words.each do |word|
    word.delete
  end
  @guesses = Guess.all
  @guesses.each do |guess|
    guess.delete
  end
  redirect '/'
end

get '/words/:id' do
  word_id = params.fetch('id').to_i
  @word = Word.find(word_id)
  @guesses= Guess.all()
  erb(:gallows)
end

post '/guesses' do
  guess = params.fetch("guess")
  @guess = Guess.create(guess: guess)
  word_id = params.fetch("word_id").to_i
  @word = Word.find(word_id)
  if @word.word.include?(guess)
    @guess.update(included: true)
    redirect("/words/#{@word.id}")
  else
    @guess.update(included: false)
    redirect("/heads/#{@word.id}")
  end
end

get("/heads/:id") do
  @guesses= Guess.all()
  word_id = params.fetch("id").to_i
  @word = Word.find(word_id)
  erb(:head)
end

get("/guesses") do
  erb(:gallows)
end
