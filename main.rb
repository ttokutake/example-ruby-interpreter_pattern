# frozen_string_literal: true

require 'pathname'
require_relative './context'
require_relative './executor'
require_relative './nodes/program_node'

def parse(text)
  context = Context.new(text)
  node = ProgramNode.new
  node.parse(context)
  node
end

def main
  path = Pathname(__dir__).join('program.txt')
  File.open(path) do |f|
    f.readlines.each do |text|
      puts "text = #{text}"

      node = parse(text)
      puts "node = #{node}"

      executor = Executor.new
      node.execute(executor)
    end
  end
end

main
