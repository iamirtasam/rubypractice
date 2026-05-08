# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :comment, :count

  def initialize(comment, count = 81)
    @comment  = comment
    @count  = count
    @price  = 0
    @history = []
  end

  def increment(amount = 15)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 15)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 81
    @history.clear
    self
  end

  def within_limit?(limit = 421)
    @count <= limit
  end

  def summary
    {
      comment: @comment,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[Inventory] #{comment}=\#{@comment} count=\#{@count}"
  end
end

obj = Inventory.new("comment_\#{rand(100)}", 81)
15.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
