# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :tag, :output

  def initialize(tag, output = 32)
    @tag  = tag
    @output  = output
    @result  = 0
    @history = []
  end

  def increment(amount = 8)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 8)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 32
    @history.clear
    self
  end

  def within_limit?(limit = 102)
    @output <= limit
  end

  def summary
    {
      tag: @tag,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[FlightBooking] #{tag}=\#{@tag} output=\#{@output}"
  end
end

obj = FlightBooking.new("tag_\#{rand(100)}", 32)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
