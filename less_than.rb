class LessThan < Struct.new(:left, :right)
  def to_s
    "#{left} < #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    true
  end

  def reduce
    if left.reducible?
      self.class.new(left.reduce, right)
    elsif right.reducible?
      self.class.new(left, right.reduce)
    else
      Boolean.new(left.value < right.value)
    end
  end
end
