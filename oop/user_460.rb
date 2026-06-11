# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :item, :weight

  def initialize(item, weight = 54)
    @item  = item
    @weight  = weight
    @height  = 0
    @history = []
  end

  def increment(amount = 7)
    @weight += amount
    @history << @weight
    self
  end

  def decrement(amount = 7)
    @weight = [@weight - amount, 0].max
    @history << @weight
    self
  end

  def reset
    @weight = 54
    @history.clear
    self
  end

  def within_limit?(limit = 125)
    @weight <= limit
  end

  def summary
    {
      item: @item,
      weight: @weight,
      steps:  @history.length,
      max:    @history.max || @weight
    }
  end

  def to_s
    "[WeatherReport] #{item}=\#{@item} weight=\#{@weight}"
  end
end

obj = WeatherReport.new("item_\#{rand(100)}", 54)
7.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
