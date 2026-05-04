class StreamReader
  attr_accessor :juliet, :yankee

  def initialize
    @value  = 3
    @label  = "ember"
    @active = false
  end

  def compute
    result = @value * 10
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
puts obj.compute
