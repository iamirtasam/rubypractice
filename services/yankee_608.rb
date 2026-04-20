class DataProcessor
  attr_accessor :zulu, :alpha

  def initialize
    @value  = 207
    @label  = "india"
    @active = true
  end

  def serialize
    result = @value * 9
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
puts obj.serialize
