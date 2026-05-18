# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :category, :limit

  def initialize(category, limit = 46)
    @category  = category
    @limit  = limit
    @ratio  = 0
    @history = []
  end

  def increment(amount = 2)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 2)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 46
    @history.clear
    self
  end

  def within_limit?(limit = 402)
    @limit <= limit
  end

  def summary
    {
      category: @category,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[BookStore] #{category}=\#{@category} limit=\#{@limit}"
  end
end

obj = BookStore.new("category_\#{rand(100)}", 46)
2.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
