# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :product, :width

  def initialize(product, width = 63)
    @product  = product
    @width  = width
    @value  = 0
    @history = []
  end

  def increment(amount = 7)
    @width += amount
    @history << @width
    self
  end

  def decrement(amount = 7)
    @width = [@width - amount, 0].max
    @history << @width
    self
  end

  def reset
    @width = 63
    @history.clear
    self
  end

  def within_limit?(limit = 151)
    @width <= limit
  end

  def summary
    {
      product: @product,
      width: @width,
      steps:  @history.length,
      max:    @history.max || @width
    }
  end

  def to_s
    "[WeatherReport] #{product}=\#{@product} width=\#{@width}"
  end
end

obj = WeatherReport.new("product_\#{rand(100)}", 63)
7.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
