class SchemaValidator
  attr_accessor :lima, :juliet

  def initialize
    @value  = 390
    @label  = "oscar"
    @active = true
  end

  def validate
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

obj = SchemaValidator.new
puts obj
puts obj.validate
