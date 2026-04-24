class NetworkClient
  attr_accessor :lima, :mike

  def initialize
    @value  = 476
    @label  = "tango"
    @active = true
  end

  def process
    result = @value * 9
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
puts obj.process
