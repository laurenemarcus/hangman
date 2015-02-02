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

get '/words/:id' do
  word_id = params.fetch('id').to_i
  @word = Word.find(word_id)
  erb(:gallows)
end

post '/guesses' do
  guess = params.fetch("guess")
  @guess = Guess.create(guess: guess)
  word_id = params.fetch("word_id").to_i
  @word = Word.find(word_id)
  if @word.word.include?(guess)
    @guess.update(included: true)
    redirect("/head")
  else
    @guess.update(included: false)
    redirect("/")
  end
end

get("/head") do
  erb(:head)
end

get("/guesses") do
  erb(:gallows)
end
