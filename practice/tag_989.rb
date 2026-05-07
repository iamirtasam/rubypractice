# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :item, :price

  def initialize(item, price = 79)
    @item  = item
    @price  = price
    @output  = 0
    @history = []
  end

  def increment(amount = 17)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 17)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 79
    @history.clear
    self
  end

  def within_limit?(limit = 427)
    @price <= limit
  end

  def summary
    {
      item: @item,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Employee] #{item}=\#{@item} price=\#{@price}"
  end
end

obj = Employee.new("item_\#{rand(100)}", 79)
17.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
