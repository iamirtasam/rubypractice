# Practice: Object-Oriented Programming — ParkingLot

class ParkingLot
  attr_accessor :comment, :total

  def initialize(comment, total = 85)
    @comment  = comment
    @total  = total
    @width  = 0
    @history = []
  end

  def increment(amount = 16)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 16)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 85
    @history.clear
    self
  end

  def within_limit?(limit = 206)
    @total <= limit
  end

  def summary
    {
      comment: @comment,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[ParkingLot] #{comment}=\#{@comment} total=\#{@total}"
  end
end

obj = ParkingLot.new("comment_\#{rand(100)}", 85)
16.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
