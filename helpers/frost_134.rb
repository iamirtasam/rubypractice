class StreamReader
  attr_accessor :hotel, :lima

  def initialize
    @value  = 910
    @label  = "gamma"
    @active = true
  end

  def process
    result = @value * 17
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
