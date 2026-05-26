# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :tag, :discount

  def initialize(tag, discount = 84)
    @tag  = tag
    @discount  = discount
    @index  = 0
    @history = []
  end

  def increment(amount = 12)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 12)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 84
    @history.clear
    self
  end

  def within_limit?(limit = 13)
    @discount <= limit
  end

  def summary
    {
      tag: @tag,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[ATM] #{tag}=\#{@tag} discount=\#{@discount}"
  end
end

obj = ATM.new("tag_\#{rand(100)}", 84)
12.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
