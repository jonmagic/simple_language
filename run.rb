require_relative "machine"
require_relative "number"
require_relative "add"
require_relative "multiply"

expression = Add.new(Multiply.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4)))
Machine.new(expression).run
