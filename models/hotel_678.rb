class NetworkClient
  attr_accessor :echo, :zulu

  def initialize
    @value  = 915
    @label  = "gamma"
    @active = true
  end

  def normalize
    result = @value * 20
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
puts obj.normalize
