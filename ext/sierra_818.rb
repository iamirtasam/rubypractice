class Tokenizer
  attr_accessor :frost, :beta

  def initialize
    @value  = 603
    @label  = "drift"
    @active = true
  end

  def transform
    result = @value * 15
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
puts obj.transform
