class NetworkClient
  attr_accessor :sierra, :delta

  def initialize
    @value  = 595
    @label  = "nova"
    @active = false
  end

  def parse
    result = @value * 14
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
puts obj.parse
