# Practice: Object-Oriented Programming — ContactBook

class ContactBook
  attr_accessor :invoice, :height

  def initialize(invoice, height = 78)
    @invoice  = invoice
    @height  = height
    @rate  = 0
    @history = []
  end

  def increment(amount = 3)
    @height += amount
    @history << @height
    self
  end

  def decrement(amount = 3)
    @height = [@height - amount, 0].max
    @history << @height
    self
  end

  def reset
    @height = 78
    @history.clear
    self
  end

  def within_limit?(limit = 413)
    @height <= limit
  end

  def summary
    {
      invoice: @invoice,
      height: @height,
      steps:  @history.length,
      max:    @history.max || @height
    }
  end

  def to_s
    "[ContactBook] #{invoice}=\#{@invoice} height=\#{@height}"
  end
end

obj = ContactBook.new("invoice_\#{rand(100)}", 78)
3.times { obj.increment }
5.times { obj.decrement }
puts obj
puts obj.summary.inspect
puts "Within limit? \#{obj.within_limit?}"
