# frozen_string_literal: true

require_relative './node'
require_relative './command_node'

# command list parser
class CommandListNode < Node
  def initialize
    @command_nodes = []
  end

  def parse(context)
    loop do
      raise 'Missing "end"' unless context.more_tokens?

      if context.current_token == 'end'
        context.skip_token('end')
        return
      end

      command_node = CommandNode.new
      command_node.parse(context)
      @command_nodes.push(command_node)
    end
  end

  def to_s
    "[#{@command_nodes.join(' ')}]"
  end
end
