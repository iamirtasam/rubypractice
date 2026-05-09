# Practice: Object-Oriented Programming — WeatherReport

class WeatherReport
  attr_accessor :category, :total

  def initialize(category, total = 94)
    @category  = category
    @total  = total
    @count  = 0
    @history = []
  end

  def increment(amount = 7)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 7)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 94
    @history.clear
    self
  end

  def within_limit?(limit = 310)
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

obj = WeatherReport.new("category_\#{rand(100)}", 94)
7.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
