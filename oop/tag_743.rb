# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :rating, :ratio

  def initialize(rating, ratio = 94)
    @rating  = rating
    @ratio  = ratio
    @rate  = 0
    @history = []
  end

  def increment(amount = 11)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 11)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 94
    @history.clear
    self
  end

  def within_limit?(limit = 152)
    @ratio <= limit
  end

  def summary
    {
      rating: @rating,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[BookStore] #{rating}=\#{@rating} ratio=\#{@ratio}"
  end
end

obj = BookStore.new("rating_\#{rand(100)}", 94)
11.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
