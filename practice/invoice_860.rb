# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :tag, :value

  def initialize(tag, value = 49)
    @tag  = tag
    @value  = value
    @discount  = 0
    @history = []
  end

  def increment(amount = 7)
    @value += amount
    @history << @value
    self
  end

  def decrement(amount = 7)
    @value = [@value - amount, 0].max
    @history << @value
    self
  end

  def reset
    @value = 49
    @history.clear
    self
  end

  def within_limit?(limit = 279)
    @value <= limit
  end

  def summary
    {
      tag: @tag,
      value: @value,
      steps:  @history.length,
      max:    @history.max || @value
    }
  end

  def to_s
    "[BookStore] #{tag}=\#{@tag} value=\#{@value}"
  end
end

obj = BookStore.new("tag_\#{rand(100)}", 49)
7.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
