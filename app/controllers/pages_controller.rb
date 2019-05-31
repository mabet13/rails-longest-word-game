require 'open-uri'
require 'json'


class PagesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << rndLetter }
  end

  def score
    @grid = params[:passedletters]
    @yourword = params[:your_word]
    if word_in_grid(@yourword , @grid)
      @result = verify_word(params[:your_word])
      @score = @yourword.size * 2
    else
      @result = "Word is invalid"
      @score = ""
    end
  end

  def rndLetter
    return ("A".."Z").to_a.sample
  end

  def verify_word(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_searched = open(url).read
    return JSON.parse(word_searched)
  end

  def word_in_grid(word, grid)
    word1 = word.upcase.chars
    word2 = grid.upcase.chars
    word1.each do |letter|
      if word2.include?(letter)
        word2.delete_at(word2.find_index(letter))
      else
        return false
      end
    end
    return true
  end
end
