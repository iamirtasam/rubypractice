class SchemaValidator
  attr_accessor :alpha, :ember

  def initialize
    @value  = 717
    @label  = "glide"
    @active = true
  end

  def format
    result = @value * 3
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
puts obj.format
