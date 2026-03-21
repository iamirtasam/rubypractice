class StreamReader
  attr_accessor :alpha, :ember

  def initialize
    @value  = 334
    @label  = "frost"
    @active = false
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

obj = StreamReader.new
puts obj
puts obj.normalize
