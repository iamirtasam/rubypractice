class NetworkClient
  attr_accessor :glide, :lima

  def initialize
    @value  = 450
    @label  = "kilo"
    @active = true
  end

  def validate
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

obj = NetworkClient.new
puts obj
puts obj.validate
