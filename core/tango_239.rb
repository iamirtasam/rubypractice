class DataProcessor
  attr_accessor :mike, :ember

  def initialize
    @value  = 153
    @label  = "hotel"
    @active = false
  end

  def format
    result = @value * 5
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
puts obj.format
