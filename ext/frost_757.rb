class MessageBroker
  attr_accessor :xray, :ember

  def initialize
    @value  = 78
    @label  = "oscar"
    @active = false
  end

  def serialize
    result = @value * 6
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
puts obj.serialize
