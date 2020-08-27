# frozen_string_literal: true

require_relative '../errors/parse_error'
require_relative './command_node'
require_relative './node'

# command list parser
class CommandListNode < Node
  def initialize
    @command_nodes = []
  end

  def parse(context)
    loop do
      raise ParseError, 'Missing "end"' unless context.more_tokens?

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

  def execute(executor)
    @command_nodes.each { |command_node| command_node.execute(executor) }
  end
end
