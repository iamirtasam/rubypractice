class MessageBroker
  attr_accessor :cedar, :tango

  def initialize
    @value  = 278
    @label  = "delta"
    @active = true
  end

  def resolve
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
puts obj.resolve
