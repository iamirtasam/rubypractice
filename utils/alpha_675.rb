class DataProcessor
  attr_accessor :ember, :foxtrot

  def initialize
    @value  = 176
    @label  = "hotel"
    @active = false
  end

  def transform
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

obj = DataProcessor.new
puts obj
puts obj.transform
