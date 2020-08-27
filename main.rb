# frozen_string_literal: true

require 'pathname'
require_relative './context'
require_relative './nodes/program_node'

def main
  path = Pathname(__dir__).join('program.txt')
  File.open(path) do |f|
    f.readlines.each do |text|
      puts "text = #{text}"
      context = Context.new(text)
      node = ProgramNode.new
      node.parse(context)
      puts "node = #{node}"
    end
  end
end

main
