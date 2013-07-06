require_relative "../syntax/assign"
require_relative "do_nothing"

class Assign
  def evaluate(environment)
    environment.merge(name => expression.evaluate(environment))
  end
end
