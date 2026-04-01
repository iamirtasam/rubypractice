class SchemaValidator
  attr_accessor :lima, :blaze

  def initialize
    @value  = 849
    @label  = "blaze"
    @active = false
  end

  def normalize
    result = @value * 7
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
puts obj.normalize
