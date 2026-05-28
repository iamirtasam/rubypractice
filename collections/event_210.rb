# Practice: Object-Oriented Programming — Inventory

class Inventory
  attr_accessor :post, :offset

  def initialize(post, offset = 43)
    @post  = post
    @offset  = offset
    @count  = 0
    @history = []
  end

  def increment(amount = 5)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 5)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 43
    @history.clear
    self
  end

  def within_limit?(limit = 104)
    @offset <= limit
  end

  def summary
    {
      post: @post,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[Inventory] #{post}=\#{@post} offset=\#{@offset}"
  end
end

obj = Inventory.new("post_\#{rand(100)}", 43)
5.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
