require_relative "add"
require_relative "boolean"
require_relative "less_than"
require_relative "machine"
require_relative "multiply"
require_relative "number"
require_relative "variable"

list = []
list << {:expression => Add.new(Multiply.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4)))}
list << {:expression => LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))}
list << {
  :expression  => Add.new(Variable.new(:x), Variable.new(:y)),
  :environment => {:x => Number.new(3), :y => Number.new(4)}
}

list.each do |item|
  Machine.new(item[:expression], item[:environment]).run
end
