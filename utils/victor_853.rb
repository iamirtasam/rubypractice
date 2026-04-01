class SchemaValidator
  attr_accessor :delta, :xray

  def initialize
    @value  = 533
    @label  = "yankee"
    @active = true
  end

  def normalize
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
puts obj.normalize
