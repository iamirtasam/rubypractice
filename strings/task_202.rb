# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :post, :median

  def initialize(post, median = 45)
    @post  = post
    @median  = median
    @discount  = 0
    @history = []
  end

  def increment(amount = 10)
    @median += amount
    @history << @median
    self
  end

  def decrement(amount = 10)
    @median = [@median - amount, 0].max
    @history << @median
    self
  end

  def reset
    @median = 45
    @history.clear
    self
  end

  def within_limit?(limit = 145)
    @median <= limit
  end

  def summary
    {
      post: @post,
      median: @median,
      steps:  @history.length,
      max:    @history.max || @median
    }
  end

  def to_s
    "[BookStore] #{post}=\#{@post} median=\#{@median}"
  end
end

obj = BookStore.new("post_\#{rand(100)}", 45)
10.times { obj.increment }
3.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
