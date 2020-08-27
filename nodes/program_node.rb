# frozen_string_literal: true

require_relative './node'
require_relative './command_list_node'

# program parser
class ProgramNode < Node
  def initialize
    @command_list_node = nil
  end

  def parse(context)
    context.skip_token('program')
    @command_list_node = CommandListNode.new
    @command_list_node.parse(context)
  end

  def to_s
    "[program #{@command_list_node}]"
  end
end
