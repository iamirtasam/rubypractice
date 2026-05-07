# Practice: Object-Oriented Programming — FlightBooking

class FlightBooking
  attr_accessor :item, :output

  def initialize(item, output = 95)
    @item  = item
    @output  = output
    @height  = 0
    @history = []
  end

  def increment(amount = 14)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 14)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 95
    @history.clear
    self
  end

  def within_limit?(limit = 228)
    @output <= limit
  end

  def summary
    {
      item: @item,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[FlightBooking] #{item}=\#{@item} output=\#{@output}"
  end
end

obj = FlightBooking.new("item_\#{rand(100)}", 95)
14.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
