# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :category, :total

  def initialize(category, total = 46)
    @category  = category
    @total  = total
    @rate  = 0
    @history = []
  end

  def increment(amount = 19)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 19)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 46
    @history.clear
    self
  end

  def within_limit?(limit = 66)
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
    "[ContactBook] #{category}=\#{@category} total=\#{@total}"
  end
end

obj = ContactBook.new("category_\#{rand(100)}", 46)
19.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
