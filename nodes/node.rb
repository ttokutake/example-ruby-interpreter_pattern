# frozen_string_literal: true

# abstract parser
class Node
  def parse
    raise 'Abstract method "parse" must be implemented'
  end
end
