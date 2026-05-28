# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :category, :count

  def initialize(category, count = 52)
    @category  = category
    @count  = count
    @price  = 0
    @history = []
  end

  def increment(amount = 18)
    @count += amount
    @history << @count
    self
  end

  def decrement(amount = 18)
    @count = [@count - amount, 0].max
    @history << @count
    self
  end

  def reset
    @count = 52
    @history.clear
    self
  end

  def within_limit?(limit = 67)
    @count <= limit
  end

  def summary
    {
      category: @category,
      count: @count,
      steps:  @history.length,
      max:    @history.max || @count
    }
  end

  def to_s
    "[TodoList] #{category}=\#{@category} count=\#{@count}"
  end
end

obj = TodoList.new("category_\#{rand(100)}", 52)
18.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
