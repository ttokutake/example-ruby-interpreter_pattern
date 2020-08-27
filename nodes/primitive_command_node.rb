# frozen_string_literal: true

require_relative './node'

# primitive command parser
class PrimitiveCommandNode < Node
  def initialize
    @name = nil
  end

  def parse(context)
    @name = context.current_token
    raise "#{@name} is undefined" unless %w[go right left].include?(@name)

    context.skip_token(@name)
  end

  def to_s
    @name
  end
end
