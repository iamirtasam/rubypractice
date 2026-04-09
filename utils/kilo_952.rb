class NetworkClient
  attr_accessor :cedar, :lima

  def initialize
    @value  = 875
    @label  = "tango"
    @active = true
  end

  def digest
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
puts obj.digest
