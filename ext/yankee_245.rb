class SchemaValidator
  attr_accessor :papa, :quest

  def initialize
    @value  = 600
    @label  = "ember"
    @active = false
  end

  def format
    result = @value * 8
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
