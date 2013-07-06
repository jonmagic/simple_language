require_relative "small_step/add"
require_relative "small_step/assign"
require_relative "small_step/boolean"
require_relative "small_step/do_nothing"
require_relative "small_step/expression_machine"
require_relative "small_step/if"
require_relative "small_step/less_than"
require_relative "small_step/machine"
require_relative "small_step/multiply"
require_relative "small_step/number"
require_relative "small_step/sequence"
require_relative "small_step/statement_machine"
require_relative "small_step/variable"
require_relative "small_step/while"

list = []
list << {:statement => Add.new(Multiply.new(Number.new(1), Number.new(2)), Multiply.new(Number.new(3), Number.new(4)))}
list << {:statement => LessThan.new(Number.new(5), Add.new(Number.new(2), Number.new(2)))}
list << {
  :statement  => Add.new(Variable.new(:x), Variable.new(:y)),
  :environment => {:x => Number.new(3), :y => Number.new(4)}
}
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
list << {
  :statement   => While.new(LessThan.new(Variable.new(:x), Number.new(5)), Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))),
  :environment => {:x => Number.new(1)}
}

list.each do |item|
  Machine.new(item[:statement], item[:environment]).run
end
