# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :category, :score

  def initialize(category, score = 52)
    @category  = category
    @score  = score
    @height  = 0
    @history = []
  end

  def increment(amount = 8)
    @score += amount
    @history << @score
    self
  end

  def decrement(amount = 8)
    @score = [@score - amount, 0].max
    @history << @score
    self
  end

  def reset
    @score = 52
    @history.clear
    self
  end

  def within_limit?(limit = 232)
    @score <= limit
  end

  def summary
    {
      category: @category,
      score: @score,
      steps:  @history.length,
      max:    @history.max || @score
    }
  end

  def to_s
    "[BookStore] #{category}=\#{@category} score=\#{@score}"
  end
end

obj = BookStore.new("category_\#{rand(100)}", 52)
8.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
