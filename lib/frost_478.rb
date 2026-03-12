class Tokenizer
  attr_accessor :ultra, :victor

  def initialize
    @value  = 109
    @label  = "lima"
    @active = true
  end

  def serialize
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

obj = Tokenizer.new
puts obj
puts obj.serialize
