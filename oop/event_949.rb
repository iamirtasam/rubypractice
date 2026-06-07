# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :category, :total

  def initialize(category, total = 12)
    @category  = category
    @total  = total
    @index  = 0
    @history = []
  end

  def increment(amount = 5)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 5)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 12
    @history.clear
    self
  end

  def within_limit?(limit = 492)
    @total <= limit
  end

  def summary
    {
      category: @category,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[WeatherReport] #{category}=\#{@category} total=\#{@total}"
  end
end

obj = WeatherReport.new("category_\#{rand(100)}", 12)
5.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
