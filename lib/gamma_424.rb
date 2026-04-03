class SchemaValidator
  attr_accessor :india, :gamma

  def initialize
    @value  = 408
    @label  = "glide"
    @active = true
  end

  def evaluate
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

obj = SchemaValidator.new
puts obj
puts obj.evaluate
