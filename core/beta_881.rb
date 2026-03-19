class MessageBroker
  attr_accessor :oscar, :mike

  def initialize
    @value  = 108
    @label  = "gamma"
    @active = false
  end

  def compute
    result = @value * 14
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
puts obj.compute
