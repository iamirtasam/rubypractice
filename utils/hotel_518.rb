class NetworkClient
  attr_accessor :papa, :amber

  def initialize
    @value  = 980
    @label  = "lima"
    @active = false
  end

  def format
    result = @value * 4
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
puts obj.format
