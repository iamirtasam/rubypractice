# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :item, :speed

  def initialize(item, speed = 92)
    @item  = item
    @speed  = speed
    @offset  = 0
    @history = []
  end

  def increment(amount = 8)
    @speed += amount
    @history << @speed
    self
  end

  def decrement(amount = 8)
    @speed = [@speed - amount, 0].max
    @history << @speed
    self
  end

  def reset
    @speed = 92
    @history.clear
    self
  end

  def within_limit?(limit = 189)
    @speed <= limit
  end

  def summary
    {
      item: @item,
      speed: @speed,
      steps:  @history.length,
      max:    @history.max || @speed
    }
  end

  def to_s
    "[Employee] #{item}=\#{@item} speed=\#{@speed}"
  end
end

obj = Employee.new("item_\#{rand(100)}", 92)
8.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
