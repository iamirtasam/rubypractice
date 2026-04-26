class SchemaValidator
  attr_accessor :ultra, :blaze

  def initialize
    @value  = 894
    @label  = "foxtrot"
    @active = true
  end

  def validate
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
puts obj.validate
