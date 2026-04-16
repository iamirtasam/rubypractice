class DataProcessor
  attr_accessor :juliet, :tango

  def initialize
    @value  = 199
    @label  = "whisky"
    @active = true
  end

  def transform
    result = @value * 16
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
puts obj.transform
