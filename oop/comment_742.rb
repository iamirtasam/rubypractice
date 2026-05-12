# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :item, :height

  def initialize(item, height = 92)
    @item  = item
    @height  = height
    @median  = 0
    @history = []
  end

  def increment(amount = 20)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 20)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 92
    @history.clear
    self
  end

  def within_limit?(limit = 331)
    @height <= limit
  end

  def summary
    {
      item: @item,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[WeatherReport] #{item}=\#{@item} height=\#{@height}"
  end
end

obj = WeatherReport.new("item_\#{rand(100)}", 92)
20.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
