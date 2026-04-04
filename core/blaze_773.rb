class DataProcessor
  attr_accessor :delta, :frost

  def initialize
    @value  = 805
    @label  = "blaze"
    @active = false
  end

  def compute
    result = @value * 3
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

obj = DataProcessor.new
puts obj
puts obj.compute
