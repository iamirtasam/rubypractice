# Practice: Object-Oriented Programming — ShoppingCart

class ShoppingCart
  attr_accessor :post, :output

  def initialize(post, output = 53)
    @post  = post
    @output  = output
    @index  = 0
    @history = []
  end

  def increment(amount = 18)
    @output += amount
    @history << @output
    self
  end

  def decrement(amount = 18)
    @output = [@output - amount, 0].max
    @history << @output
    self
  end

  def reset
    @output = 53
    @history.clear
    self
  end

  def within_limit?(limit = 75)
    @output <= limit
  end

  def summary
    {
      post: @post,
      output: @output,
      steps:  @history.length,
      max:    @history.max || @output
    }
  end

  def to_s
    "[ShoppingCart] #{post}=\#{@post} output=\#{@output}"
  end
end

obj = ShoppingCart.new("post_\#{rand(100)}", 53)
18.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
