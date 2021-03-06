# frozen_string_literal: true

require_relative './command_list_node'
require_relative './node'

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

  def execute(executor)
    @command_list_node.execute(executor)
  end
end
