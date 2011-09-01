# word lists from http://www.ashley-bovan.co.uk/words/partsofspeech.html

class Array
  def rand
    self[Kernel.rand(length)]
  end
end

def load(filename)
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

adjectives = load 'words/2syllableadjectives.txt'
nouns = load 'words/2syllablenouns.txt'

# seed_string = "835164712f0a23dd77d55c2aea553ca56412f083"

letter = adjectives.keys[rand 26]
puts "#{adjectives[letter].rand.capitalize} #{nouns[letter].rand.capitalize}"