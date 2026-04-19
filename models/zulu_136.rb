class Tokenizer
  attr_accessor :gamma, :glide

  def initialize
    @value  = 467
    @label  = "glide"
    @active = true
  end

  def serialize
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

obj = Tokenizer.new
puts obj
puts obj.serialize
