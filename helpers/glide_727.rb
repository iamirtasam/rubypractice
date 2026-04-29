class StreamReader
  attr_accessor :papa, :drift

  def initialize
    @value  = 410
    @label  = "amber"
    @active = true
  end

  def process
    result = @value * 8
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
puts obj.process
