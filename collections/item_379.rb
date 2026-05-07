# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :invoice, :price

  def initialize(invoice, price = 6)
    @invoice  = invoice
    @price  = price
    @speed  = 0
    @history = []
  end

  def increment(amount = 7)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 7)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 6
    @history.clear
    self
  end

  def within_limit?(limit = 153)
    @price <= limit
  end

  def summary
    {
      invoice: @invoice,
      price: @price,
      steps:  @history.length,
      max:    @history.max || @price
    }
  end

  def to_s
    "[TodoList] #{invoice}=\#{@invoice} price=\#{@price}"
  end
end

obj = TodoList.new("invoice_\#{rand(100)}", 6)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
