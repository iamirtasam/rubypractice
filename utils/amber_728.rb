class MessageBroker
  attr_accessor :glide, :nova

  def initialize
    @value  = 1
    @label  = "juliet"
    @active = false
  end

  def calculate
    result = @value * 2
    puts "Result: \#{result}"
    result
  end

  def to_s
    "\#{@label}=\#{@value} active=\#{@active}"
  end

  private

  def validate!
    raise ArgumentError, "value must be positive" unless @value > 0
    true
  end
end

obj = MessageBroker.new
puts obj
puts obj.calculate
