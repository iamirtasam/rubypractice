# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :tag, :height

  def initialize(tag, height = 64)
    @tag  = tag
    @height  = height
    @limit  = 0
    @history = []
  end

  def increment(amount = 8)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 8)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 64
    @history.clear
    self
  end

  def within_limit?(limit = 108)
    @height <= limit
  end

  def summary
    {
      tag: @tag,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[TodoList] #{tag}=\#{@tag} height=\#{@height}"
  end
end

obj = TodoList.new("tag_\#{rand(100)}", 64)
8.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
