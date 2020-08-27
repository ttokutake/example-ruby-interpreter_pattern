# frozen_string_literal: true

require_relative './node'
require_relative './primitive_command_node'
require_relative './repeat_command_node'

# command parser
class CommandNode < Node
  def initialize
    @node = nil
  end

  def parse(context)
    if context.current_token == 'repeat'
      @node = RepeatCommandNode.new
      @node.parse(context)
      return
    end

    @node = PrimitiveCommandNode.new
    @node.parse(context)
  end

  def to_s
    @node.to_s
  end
end
