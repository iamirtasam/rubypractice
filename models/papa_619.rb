class MessageBroker
  attr_accessor :drift, :tango

  def initialize
    @value  = 523
    @label  = "cedar"
    @active = false
  end

  def parse
    result = @value * 17
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
