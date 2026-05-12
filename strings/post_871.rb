# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :review, :speed

  def initialize(review, speed = 3)
    @review  = review
    @speed  = speed
    @index  = 0
    @history = []
  end

  def increment(amount = 3)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 3)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 3
    @history.clear
    self
  end

  def within_limit?(limit = 330)
    @speed <= limit
  end

  def summary
    {
      review: @review,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[Inventory] #{review}=\#{@review} speed=\#{@speed}"
  end
end

obj = Inventory.new("review_\#{rand(100)}", 3)
3.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
