class ExpressionMachine < Struct.new(:expression, :environment)
  def step
    self.expression = expression.reduce(environment)
  end

  def run
    while expression.reducible?
      puts "Small step result: #{expression}"
      step
    end

    puts "Small step result: #{expression}"
  end
end
