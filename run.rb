require_relative "big_step"
require_relative "small_step"

require_relative "parser"


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

parse_tree = SimpleParser.new.parse("while (x < 5) { x = x * 3 }")
list << {
  :statement   => parse_tree.to_ast,
  :environment => {:x => Number.new(1)}
}



list.each do |item|
  Machine.new(item[:statement], item[:environment]).run
  puts "Big step result: #{item[:statement].evaluate(item[:environment])}"
end

