# word lists from http://www.ashley-bovan.co.uk/words/partsofspeech.html

require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'haml'

class Array
  def rand
    self[Kernel.rand(length)]
  end
end

def load_words(filename)
  list = File.read(filename).split("\n")
  by_letter = {}
  list.each do |word|
    letter = word[0].chr
    sublist = by_letter[letter]
    sublist ||= []
    sublist << word.strip
    by_letter[letter] = sublist
  end
  by_letter
end

def seed_string(some_string)
  srand some_string.hash
end

configure do
  ADJECTIVES = load_words 'words/2syllableadjectives.txt'
  NOUNS = load_words 'words/2syllablenouns.txt'
end

get '/*' do
  if params[:splat] != [""]
    puts "seeding with #{params[:splat].inspect}"
    seed_string params[:splat]
  end
  letter = ADJECTIVES.keys[rand 26]
  "#{ADJECTIVES[letter].rand.capitalize} #{NOUNS[letter].rand.capitalize}"
end

