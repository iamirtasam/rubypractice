class SchemaValidator
  attr_accessor :cedar, :beta

  def initialize
    @value  = 223
    @label  = "juliet"
    @active = false
  end

  def compute
    result = @value * 13
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
puts obj.compute
