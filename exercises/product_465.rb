# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :tag, :average

  def initialize(tag, average = 70)
    @tag  = tag
    @average  = average
    @discount  = 0
    @history = []
  end

  def increment(amount = 14)
    @average += amount
    @history << @average
    self
  end

  def decrement(amount = 14)
    @average = [@average - amount, 0].max
    @history << @average
    self
  end

  def reset
    @average = 70
    @history.clear
    self
  end

  def within_limit?(limit = 241)
    @average <= limit
  end

  def summary
    {
      tag: @tag,
      average: @average,
      steps:  @history.length,
      max:    @history.max || @average
    }
  end

  def to_s
    "[HotelReservation] #{tag}=\#{@tag} average=\#{@average}"
  end
end

obj = HotelReservation.new("tag_\#{rand(100)}", 70)
14.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
