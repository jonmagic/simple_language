require_relative "../syntax/while"
require_relative "if"
require_relative "do_nothing"
require_relative "sequence"

class While
  def evaluate(environment)
    case condition.evaluate(environment)
    when Boolean.new(true)
      evaluate(body.evaluate(environment))
    when Boolean.new(false)
      environment
    end
  end
end
