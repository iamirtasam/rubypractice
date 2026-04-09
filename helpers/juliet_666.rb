class SchemaValidator
  attr_accessor :zulu, :beta

  def initialize
    @value  = 437
    @label  = "ember"
    @active = true
  end

  def format
    result = @value * 17
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
