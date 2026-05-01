class MessageBroker
  attr_accessor :ultra, :blaze

  def initialize
    @value  = 675
    @label  = "ember"
    @active = false
  end

  def normalize
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
puts obj.normalize
