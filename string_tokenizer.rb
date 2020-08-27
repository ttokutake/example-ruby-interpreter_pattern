# frozen_string_literal: true

# tokenizer
class StringTokenizer
  def initialize(text)
    @tokens = text.strip.split(/\s+/)
    @index = 0
  end

  def next_token
    return nil unless more_tokens?

    token = @tokens[@index]
    @index += 1
    token
  end

  private

  def more_tokens?
    @index < @tokens.length
  end
end
