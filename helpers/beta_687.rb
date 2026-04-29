class StreamReader
  attr_accessor :delta, :blaze

  def initialize
    @value  = 928
    @label  = "papa"
    @active = true
  end

  def evaluate
    result = @value * 12
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
puts obj.evaluate
