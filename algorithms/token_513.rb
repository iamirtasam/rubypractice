# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :item, :price

  def initialize(item, price = 23)
    @item  = item
    @price  = price
    @ratio  = 0
    @history = []
  end

  def increment(amount = 12)
    @price += amount
    @history << @price
    self
  end

  def decrement(amount = 12)
    @price = [@price - amount, 0].max
    @history << @price
    self
  end

  def reset
    @price = 23
    @history.clear
    self
  end

  def within_limit?(limit = 355)
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
    "[Inventory] #{item}=\#{@item} price=\#{@price}"
  end
end

obj = Inventory.new("item_\#{rand(100)}", 23)
12.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
