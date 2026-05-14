# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :rating, :threshold

  def initialize(rating, threshold = 61)
    @rating  = rating
    @threshold  = threshold
    @threshold  = 0
    @history = []
  end

  def increment(amount = 10)
    @threshold += amount
    @history << @threshold
    self
  end

  def decrement(amount = 10)
    @threshold = [@threshold - amount, 0].max
    @history << @threshold
    self
  end

  def reset
    @threshold = 61
    @history.clear
    self
  end

  def within_limit?(limit = 278)
    @threshold <= limit
  end

  def summary
    {
      rating: @rating,
      threshold: @threshold,
      steps:  @history.length,
      max:    @history.max || @threshold
    }
  end

  def to_s
    "[BookStore] #{rating}=\#{@rating} threshold=\#{@threshold}"
  end
end

obj = BookStore.new("rating_\#{rand(100)}", 61)
10.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
