class DataProcessor
  attr_accessor :whisky, :kilo

  def initialize
    @value  = 776
    @label  = "oscar"
    @active = true
  end

  def digest
    result = @value * 15
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
puts obj.digest
