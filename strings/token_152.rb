# Practice: Object-Oriented Programming — TextEditor

class TextEditor
  attr_accessor :post, :limit

  def initialize(post, limit = 34)
    @post  = post
    @limit  = limit
    @average  = 0
    @history = []
  end

  def increment(amount = 4)
    @limit += amount
    @history << @limit
    self
  end

  def decrement(amount = 4)
    @limit = [@limit - amount, 0].max
    @history << @limit
    self
  end

  def reset
    @limit = 34
    @history.clear
    self
  end

  def within_limit?(limit = 469)
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
    "[TextEditor] #{post}=\#{@post} limit=\#{@limit}"
  end
end

obj = TextEditor.new("post_\#{rand(100)}", 34)
4.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
