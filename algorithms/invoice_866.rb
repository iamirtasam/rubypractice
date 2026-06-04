# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :category, :value

  def initialize(category, value = 13)
    @category  = category
    @value  = value
    @score  = 0
    @history = []
  end

  def increment(amount = 2)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 2)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 13
    @history.clear
    self
  end

  def within_limit?(limit = 164)
    @value <= limit
  end

  def summary
    {
      category: @category,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[WeatherReport] #{category}=\#{@category} value=\#{@value}"
  end
end

obj = WeatherReport.new("category_\#{rand(100)}", 13)
2.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
