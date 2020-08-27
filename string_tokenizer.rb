# frozen_string_literal: true

# tokenizer
class StringTokenizer
  def initialize(text)
    @tokens = text.strip.split(/\s+/)
    @index = 0
  end

  def more_tokens?
    !@tokens[@index].nil?
  end

  def next_token
    token = @tokens[@index]
    @index += 1
    token
  end
end
