class SchemaValidator
  attr_accessor :mike, :lima

  def initialize
    @value  = 369
    @label  = "kilo"
    @active = false
  end

  def parse
    result = @value * 12
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
puts obj.parse
