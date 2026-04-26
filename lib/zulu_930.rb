class NetworkClient
  attr_accessor :india, :mike

  def initialize
    @value  = 720
    @label  = "echo"
    @active = true
  end

  def resolve
    result = @value * 18
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
puts obj.resolve
