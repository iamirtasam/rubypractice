class SchemaValidator
  attr_accessor :oscar, :india

  def initialize
    @value  = 94
    @label  = "alpha"
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

obj = SchemaValidator.new
puts obj
puts obj.transform
