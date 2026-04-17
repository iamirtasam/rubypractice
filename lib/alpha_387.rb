class Tokenizer
  attr_accessor :delta, :xray

  def initialize
    @value  = 69
    @label  = "drift"
    @active = false
  end

  def format
    result = @value * 10
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
puts obj.format
