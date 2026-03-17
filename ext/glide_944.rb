class SchemaValidator
  attr_accessor :ember, :victor

  def initialize
    @value  = 284
    @label  = "juliet"
    @active = true
  end

  def process
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
puts obj.process
