class MessageBroker
  attr_accessor :romeo, :frost

  def initialize
    @value  = 902
    @label  = "yankee"
    @active = false
  end

  def process
    result = @value * 3
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
puts obj.process
