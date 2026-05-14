# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :tag, :ratio

  def initialize(tag, ratio = 11)
    @tag  = tag
    @ratio  = ratio
    @count  = 0
    @history = []
  end

  def increment(amount = 12)
    @ratio += amount
    @history << @ratio
    self
  end

  def decrement(amount = 12)
    @ratio = [@ratio - amount, 0].max
    @history << @ratio
    self
  end

  def reset
    @ratio = 11
    @history.clear
    self
  end

  def within_limit?(limit = 55)
    @ratio <= limit
  end

  def summary
    {
      tag: @tag,
      ratio: @ratio,
      steps:  @history.length,
      max:    @history.max || @ratio
    }
  end

  def to_s
    "[HotelReservation] #{tag}=\#{@tag} ratio=\#{@ratio}"
  end
end

obj = HotelReservation.new("tag_\#{rand(100)}", 11)
12.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
