# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :review, :limit

  def initialize(review, limit = 85)
    @review  = review
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
    @limit = 85
    @history.clear
    self
  end

  def within_limit?(limit = 119)
    @limit <= limit
  end

  def summary
    {
      review: @review,
      limit: @limit,
      steps:  @history.length,
      max:    @history.max || @limit
    }
  end

  def to_s
    "[ContactBook] #{review}=\#{@review} limit=\#{@limit}"
  end
end

obj = ContactBook.new("review_\#{rand(100)}", 85)
4.times { obj.increment }
4.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
