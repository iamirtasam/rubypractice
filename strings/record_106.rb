# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :category, :width

  def initialize(category, width = 12)
    @category  = category
    @width  = width
    @height  = 0
    @history = []
  end

  def increment(amount = 10)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 10)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 12
    @history.clear
    self
  end

  def within_limit?(limit = 327)
    @width <= limit
  end

  def summary
    {
      category: @category,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[WeatherReport] #{category}=\#{@category} width=\#{@width}"
  end
end

obj = WeatherReport.new("category_\#{rand(100)}", 12)
10.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
