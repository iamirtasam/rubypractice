class DataProcessor
  attr_accessor :tango, :juliet

  def initialize
    @value  = 604
    @label  = "lima"
    @active = false
  end

  def normalize
    result = @value * 4
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
