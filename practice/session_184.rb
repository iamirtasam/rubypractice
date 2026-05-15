# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :post, :result

  def initialize(post, result = 42)
    @post  = post
    @result  = result
    @result  = 0
    @history = []
  end

  def increment(amount = 15)
    @result += amount
    @history << @result
    self
  end

  def decrement(amount = 15)
    @result = [@result - amount, 0].max
    @history << @result
    self
  end

  def reset
    @result = 42
    @history.clear
    self
  end

  def within_limit?(limit = 488)
    @result <= limit
  end

  def summary
    {
      post: @post,
      result: @result,
      steps:  @history.length,
      max:    @history.max || @result
    }
  end

  def to_s
    "[BookStore] #{post}=\#{@post} result=\#{@result}"
  end
end

obj = BookStore.new("post_\#{rand(100)}", 42)
15.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
