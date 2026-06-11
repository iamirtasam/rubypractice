# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :rating, :limit

  def initialize(rating, limit = 47)
    @rating  = rating
    @limit  = limit
    @rate  = 0
    @history = []
  end

  def increment(amount = 17)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 17)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 47
    @history.clear
    self
  end

  def within_limit?(limit = 49)
    @limit <= limit
  end

  def summary
    {
      rating: @rating,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[Library] #{rating}=\#{@rating} limit=\#{@limit}"
  end
end

obj = Library.new("rating_\#{rand(100)}", 47)
17.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
