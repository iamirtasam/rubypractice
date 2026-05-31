# Practice: Object-Oriented Programming — Library

class Library
  attr_accessor :rating, :average

  def initialize(rating, average = 19)
    @rating  = rating
    @average  = average
    @offset  = 0
    @history = []
  end

  def increment(amount = 10)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 10)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 19
    @history.clear
    self
  end

  def within_limit?(limit = 120)
    @average <= limit
  end

  def summary
    {
      rating: @rating,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[Library] #{rating}=\#{@rating} average=\#{@average}"
  end
end

obj = Library.new("rating_\#{rand(100)}", 19)
10.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
