# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :category, :speed

  def initialize(category, speed = 7)
    @category  = category
    @speed  = speed
    @weight  = 0
    @history = []
  end

  def increment(amount = 16)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 16)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 7
    @history.clear
    self
  end

  def within_limit?(limit = 33)
    @speed <= limit
  end

  def summary
    {
      category: @category,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[BookStore] #{category}=\#{@category} speed=\#{@speed}"
  end
end

obj = BookStore.new("category_\#{rand(100)}", 7)
16.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
