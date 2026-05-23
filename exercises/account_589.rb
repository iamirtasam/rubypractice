# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :tag, :discount

  def initialize(tag, discount = 55)
    @tag  = tag
    @discount  = discount
    @result  = 0
    @history = []
  end

  def increment(amount = 5)
    @discount += amount
    @history << @discount
    self
  end

  def decrement(amount = 5)
    @discount = [@discount - amount, 0].max
    @history << @discount
    self
  end

  def reset
    @discount = 55
    @history.clear
    self
  end

  def within_limit?(limit = 359)
    @discount <= limit
  end

  def summary
    {
      tag: @tag,
      discount: @discount,
      steps:  @history.length,
      max:    @history.max || @discount
    }
  end

  def to_s
    "[WeatherReport] #{tag}=\#{@tag} discount=\#{@discount}"
  end
end

obj = WeatherReport.new("tag_\#{rand(100)}", 55)
5.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
