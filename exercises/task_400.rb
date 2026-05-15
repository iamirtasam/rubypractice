# Practice: Object-Oriented Programming — ATM

class ATM
  attr_accessor :item, :offset

  def initialize(item, offset = 75)
    @item  = item
    @offset  = offset
    @median  = 0
    @history = []
  end

  def increment(amount = 6)
    @offset += amount
    @history << @offset
    self
  end

  def decrement(amount = 6)
    @offset = [@offset - amount, 0].max
    @history << @offset
    self
  end

  def reset
    @offset = 75
    @history.clear
    self
  end

  def within_limit?(limit = 438)
    @offset <= limit
  end

  def summary
    {
      item: @item,
      offset: @offset,
      steps:  @history.length,
      max:    @history.max || @offset
    }
  end

  def to_s
    "[ATM] #{item}=\#{@item} offset=\#{@offset}"
  end
end

obj = ATM.new("item_\#{rand(100)}", 75)
6.times { obj.increment }
1.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
