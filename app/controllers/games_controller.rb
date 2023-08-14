class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @api_url = "https://wagon-dictionary.herokuapp.com/"
    @query_url = "https://wagon-dictionary.herokuapp.com/" + params[:word]
    @word = params[:word].upcase.split('')
    @letters = params[:letters].split

    if @word.all? { |word| @letters.include?(word) }
      api_response = HTTParty.get(@query_url)
      api_response['found']? @response = 'The word is correct' : @response = 'Unfortunately, the answer is not an english word'
    else
      @response = 'The word does not match the given letters'
    end
  end
end
