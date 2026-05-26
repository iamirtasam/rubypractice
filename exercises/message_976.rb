# Practice: Object-Oriented Programming — Employee

class Employee
  attr_accessor :product, :weight

  def initialize(product, weight = 3)
    @product  = product
    @weight  = weight
    @score  = 0
    @history = []
  end

  def increment(amount = 9)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 9)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 3
    @history.clear
    self
  end

  def within_limit?(limit = 172)
    @weight <= limit
  end

  def summary
    {
      product: @product,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[Employee] #{product}=\#{@product} weight=\#{@weight}"
  end
end

obj = Employee.new("product_\#{rand(100)}", 3)
9.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
