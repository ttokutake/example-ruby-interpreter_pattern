# frozen_string_literal: true

# abstract parser
class Node
  def parse(_context)
    raise NoMethodError, 'Abstract method "parse" must be implemented'
  end

  def execute(_executor)
    raise NoMethodError, 'Abstract method "execute" must be implemented'
  end
end
