require_relative "add"
require_relative "boolean"
require_relative "less_than"
require_relative "machine"
require_relative "multiply"
require_relative "number"

expression = Add.new(Multiply.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4)))
Machine.new(expression).run

expression = LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))
Machine.new(expression).run
