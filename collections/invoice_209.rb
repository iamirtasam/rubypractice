# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :item, :discount

  def initialize(item, discount = 15)
    @item  = item
    @discount  = discount
    @threshold  = 0
    @history = []
  end

  def increment(amount = 17)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 17)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 15
    @history.clear
    self
  end

  def within_limit?(limit = 65)
    @discount <= limit
  end

  def summary
    {
      item: @item,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[Student] #{item}=\#{@item} discount=\#{@discount}"
  end
end

obj = Student.new("item_\#{rand(100)}", 15)
17.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
