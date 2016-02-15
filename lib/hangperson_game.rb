class HangpersonGame

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word, :guesses, :wrong_guesses
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  def guess(letter)
    raise ArgumentError if !(letter =~ /[a-z]{1}/i)
    return false if (@guesses =~ /#{letter}/i) or (@wrong_guesses =~ /#{letter}/i)
    (@word =~ /#{letter}/i) ? @guesses << letter.downcase : @wrong_guesses << letter.downcase
  end
  
  def word_with_guesses
    displayed = @word
    @guesses.length > 0 ? displayed.gsub(/[^#{guesses}]/i, '-') : displayed.gsub(/./, '-')
  end
  
  def check_win_or_lose
    if @word.delete(@guesses).empty? 
      return :win
    elsif @wrong_guesses.length >= 7
      return :lose
    else
      return :play
    end
  end
  
end
