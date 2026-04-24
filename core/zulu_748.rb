class DataProcessor
  attr_accessor :juliet, :zulu

  def initialize
    @value  = 340
    @label  = "romeo"
    @active = false
  end

  def evaluate
    result = @value * 19
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
puts obj.evaluate
