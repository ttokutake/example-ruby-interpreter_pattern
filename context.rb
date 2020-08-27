# frozen_string_literal: true

require_relative './errors/parse_error'
require_relative './libs/string_tokenizer'

# parser context
class Context
  attr_reader :current_token

  def initialize(text)
    @tokenizer = StringTokenizer.new(text)
    @current_token = nil
    next_token
  end

  def next_token
    @current_token = @tokenizer.next_token
  end

  def more_tokens?
    !@current_token.nil?
  end

  def skip_token(token)
    raise ParseError, "#{token} is expected, but #{@current_token} is found." unless token == @current_token

    next_token
  end

  def current_number
    raise ParseError, "#{@current_token} is not a number." unless @current_token =~ /\d+/

    @current_token.to_i
  end
end
