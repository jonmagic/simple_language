require_relative "../syntax/sequence"
require_relative "do_nothing"

class Sequence
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end
end
