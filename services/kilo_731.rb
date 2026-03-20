class NetworkClient
  attr_accessor :juliet, :hotel

  def initialize
    @value  = 732
    @label  = "hotel"
    @active = true
  end

  def process
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

obj = NetworkClient.new
puts obj
puts obj.process
