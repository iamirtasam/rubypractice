# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :tag, :total

  def initialize(tag, total = 59)
    @tag  = tag
    @total  = total
    @ratio  = 0
    @history = []
  end

  def increment(amount = 11)
    @total += amount
    @history << @total
    self
  end

  def decrement(amount = 11)
    @total = [@total - amount, 0].max
    @history << @total
    self
  end

  def reset
    @total = 59
    @history.clear
    self
  end

  def within_limit?(limit = 242)
    @total <= limit
  end

  def summary
    {
      tag: @tag,
      total: @total,
      steps:  @history.length,
      max:    @history.max || @total
    }
  end

  def to_s
    "[BookStore] #{tag}=\#{@tag} total=\#{@total}"
  end
end

obj = BookStore.new("tag_\#{rand(100)}", 59)
11.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
