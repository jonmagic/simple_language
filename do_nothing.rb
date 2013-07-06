class DoNothing
  def to_s
    "do-nothing"
  end

  def inspect
    "<<#{self}>>"
  end

  def ==(other_statement)
    other_statement.instance_of?(self.class)
  end

  def reducible?
    false
  end
end
