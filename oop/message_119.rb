# Practice: Object-Oriented Programming — Student

class Student
  attr_accessor :rating, :total

  def initialize(rating, total = 9)
    @rating  = rating
    @total  = total
    @ratio  = 0
    @history = []
  end

  def increment(amount = 5)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 5)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 9
    @history.clear
    self
  end

  def within_limit?(limit = 429)
    @total <= limit
  end

  def summary
    {
      rating: @rating,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[Student] #{rating}=\#{@rating} total=\#{@total}"
  end
end

obj = Student.new("rating_\#{rand(100)}", 9)
5.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
