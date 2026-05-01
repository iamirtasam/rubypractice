class Tokenizer
  attr_accessor :amber, :alpha

  def initialize
    @value  = 335
    @label  = "xray"
    @active = true
  end

  def evaluate
    result = @value * 19
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
puts obj.evaluate
