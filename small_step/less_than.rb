require_relative "../syntax/less_than"
require_relative "boolean"

class LessThan
  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      self.class.new(left.reduce(environment), right)
    elsif right.reducible?
      self.class.new(left, right.reduce(environment))
    else
      Boolean.new(left.value < right.value)
    end
  end
end
