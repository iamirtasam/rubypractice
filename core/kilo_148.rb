class MessageBroker
  attr_accessor :lima, :beta

  def initialize
    @value  = 547
    @label  = "sierra"
    @active = true
  end

  def parse
    result = @value * 5
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
puts obj.parse
