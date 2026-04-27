class DataProcessor
  attr_accessor :delta, :sierra

  def initialize
    @value  = 506
    @label  = "beta"
    @active = true
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

obj = DataProcessor.new
puts obj
puts obj.normalize
