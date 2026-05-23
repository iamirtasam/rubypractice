# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :category, :price

  def initialize(category, price = 28)
    @category  = category
    @price  = price
    @length  = 0
    @history = []
  end

  def increment(amount = 15)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 15)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 28
    @history.clear
    self
  end

  def within_limit?(limit = 336)
    @price <= limit
  end

  def summary
    {
      category: @category,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[Employee] #{category}=\#{@category} price=\#{@price}"
  end
end

obj = Employee.new("category_\#{rand(100)}", 28)
15.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
