class MessageBroker
  attr_accessor :xray, :beta

  def initialize
    @value  = 358
    @label  = "drift"
    @active = false
  end

  def normalize
    result = @value * 16
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
puts obj.normalize
