class StreamReader
  attr_accessor :nova, :ember

  def initialize
    @value  = 873
    @label  = "india"
    @active = true
  end

  def compute
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
puts obj.compute
