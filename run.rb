require "pry"
require_relative "add"
require_relative "assign"
require_relative "boolean"
require_relative "do_nothing"
require_relative "if"
require_relative "less_than"
require_relative "machine"
require_relative "multiply"
require_relative "number"
require_relative "sequence"
require_relative "variable"

list = []
# list << {:statement => Add.new(Multiply.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4)))}
# list << {:statement => LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))}
# list << {
#   :statement  => Add.new(Variable.new(:x), Variable.new(:y)),
#   :environment => {:x => Number.new(3), :y => Number.new(4)}
# }
list << {
  :statement   => Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
  :environment => {:x => Number.new(2)}
}
list << {
  :statement   => If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), Assign.new(:y, Number.new(2))),
  :environment => {:x => Boolean.new(true)}
}
list << {
  :statement   => Sequence.new(Assign.new(:x, Add.new(Number.new(1), Number.new(1))), Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))),
  :environment => {}
}

list.each do |item|
  Machine.new(item[:statement], item[:environment]).run
end
