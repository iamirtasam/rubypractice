# Practice: Object-Oriented Programming — VendingMachine

class VendingMachine
  attr_accessor :review, :length

  def initialize(review, length = 93)
    @review  = review
    @length  = length
    @ratio  = 0
    @history = []
  end

  def increment(amount = 14)
    @length += amount
    @history << @length
    self
  end

  def decrement(amount = 14)
    @length = [@length - amount, 0].max
    @history << @length
    self
  end

  def reset
    @length = 93
    @history.clear
    self
  end

  def within_limit?(limit = 268)
    @length <= limit
  end

  def summary
    {
      review: @review,
      length: @length,
      steps:  @history.length,
      max:    @history.max || @length
    }
  end

  def to_s
    "[VendingMachine] #{review}=\#{@review} length=\#{@length}"
  end
end

obj = VendingMachine.new("review_\#{rand(100)}", 93)
14.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
