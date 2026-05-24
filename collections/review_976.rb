# Practice: Object-Oriented Programming — TodoList

class TodoList
  attr_accessor :post, :index

  def initialize(post, index = 53)
    @post  = post
    @index  = index
    @average  = 0
    @history = []
  end

  def increment(amount = 17)
    @index += amount
    @history << @index
    self
  end

  def decrement(amount = 17)
    @index = [@index - amount, 0].max
    @history << @index
    self
  end

  def reset
    @index = 53
    @history.clear
    self
  end

  def within_limit?(limit = 407)
    @index <= limit
  end

  def summary
    {
      post: @post,
      index: @index,
      steps:  @history.length,
      max:    @history.max || @index
    }
  end

  def to_s
    "[TodoList] #{post}=\#{@post} index=\#{@index}"
  end
end

obj = TodoList.new("post_\#{rand(100)}", 53)
17.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
