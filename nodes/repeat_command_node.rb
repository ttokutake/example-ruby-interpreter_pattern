# frozen_string_literal: true

require_relative './node'
require_relative './command_list_node'

# repeat command parser
class RepeatCommandNode < Node
  def initialize
    @number = nil
    @command_list_node = nil
  end

  def parse(context)
    context.skip_token('repeat')
    @number = context.current_number
    context.next_token
    @command_list_node = CommandListNode.new
    @command_list_node.parse(context)
  end

  def to_s
    "[repeat #{@number} #{@command_list_node}]"
  end
end
