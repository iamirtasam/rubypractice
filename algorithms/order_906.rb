# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :product, :total

  def initialize(product, total = 59)
    @product  = product
    @total  = total
    @price  = 0
    @history = []
  end

  def increment(amount = 14)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 14)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 59
    @history.clear
    self
  end

  def within_limit?(limit = 111)
    @total <= limit
  end

  def summary
    {
      product: @product,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[WeatherReport] #{product}=\#{@product} total=\#{@total}"
  end
end

obj = WeatherReport.new("product_\#{rand(100)}", 59)
14.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
