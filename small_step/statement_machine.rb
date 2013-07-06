class StatementMachine < Struct.new(:statement, :environment)
  def step
    self.statement, self.environment = statement.reduce(environment)
  end

  def run
    while statement.reducible?
      puts "Small step result: #{statement}, #{environment}"
      step
    end

    puts "Small step result: #{statement}, #{environment}"
  end
end
