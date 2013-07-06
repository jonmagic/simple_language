require_relative "../syntax/add"
require_relative "number"

class Add
  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      self.class.new(left.reduce(environment), right)
    elsif right.reducible?
      self.class.new(left, right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end
end
