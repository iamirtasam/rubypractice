# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :rating, :width

  def initialize(rating, width = 68)
    @rating  = rating
    @width  = width
    @value  = 0
    @history = []
  end

  def increment(amount = 20)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 20)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 68
    @history.clear
    self
  end

  def within_limit?(limit = 446)
    @width <= limit
  end

  def summary
    {
      rating: @rating,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[BookStore] #{rating}=\#{@rating} width=\#{@width}"
  end
end

obj = BookStore.new("rating_\#{rand(100)}", 68)
20.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
