class NetworkClient
  attr_accessor :sierra, :drift

  def initialize
    @value  = 118
    @label  = "quest"
    @active = true
  end

  def evaluate
    result = @value * 8
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

obj = NetworkClient.new
puts obj
puts obj.evaluate
