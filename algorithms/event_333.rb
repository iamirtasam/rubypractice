# Practice: Object-Oriented Programming — HotelReservation

class HotelReservation
  attr_accessor :tag, :offset

  def initialize(tag, offset = 81)
    @tag  = tag
    @offset  = offset
    @count  = 0
    @history = []
  end

  def increment(amount = 17)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 17)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 81
    @history.clear
    self
  end

  def within_limit?(limit = 24)
    @offset <= limit
  end

  def summary
    {
      tag: @tag,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[HotelReservation] #{tag}=\#{@tag} offset=\#{@offset}"
  end
end

obj = HotelReservation.new("tag_\#{rand(100)}", 81)
17.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
