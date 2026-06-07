# Practice: Object-Oriented Programming — BookStore

class BookStore
  attr_accessor :post, :limit

  def initialize(post, limit = 55)
    @post  = post
    @limit  = limit
    @length  = 0
    @history = []
  end

  def increment(amount = 19)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 19)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 55
    @history.clear
    self
  end

  def within_limit?(limit = 216)
    @limit <= limit
  end

  def summary
    {
      post: @post,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[BookStore] #{post}=\#{@post} limit=\#{@limit}"
  end
end

obj = BookStore.new("post_\#{rand(100)}", 55)
19.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
