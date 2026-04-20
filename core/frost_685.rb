class StreamReader
  attr_accessor :ember, :tango

  def initialize
    @value  = 216
    @label  = "victor"
    @active = false
  end

  def serialize
    result = @value * 15
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
puts obj.serialize
