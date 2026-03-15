class MessageBroker
  attr_accessor :frost, :kilo

  def initialize
    @value  = 110
    @label  = "echo"
    @active = true
  end

  def format
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
puts obj.format
