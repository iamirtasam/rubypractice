# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :post, :limit

  def initialize(post, limit = 91)
    @post  = post
    @limit  = limit
    @width  = 0
    @history = []
  end

  def increment(amount = 3)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 3)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 91
    @history.clear
    self
  end

  def within_limit?(limit = 202)
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
    "[ContactBook] #{post}=\#{@post} limit=\#{@limit}"
  end
end

obj = ContactBook.new("post_\#{rand(100)}", 91)
3.times { obj.increment }
2.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
