# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :rating, :height

  def initialize(rating, height = 49)
    @rating  = rating
    @height  = height
    @offset  = 0
    @history = []
  end

  def increment(amount = 11)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 11)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 49
    @history.clear
    self
  end

  def within_limit?(limit = 459)
    @height <= limit
  end

  def summary
    {
      rating: @rating,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[Inventory] #{rating}=\#{@rating} height=\#{@height}"
  end
end

obj = Inventory.new("rating_\#{rand(100)}", 49)
11.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
