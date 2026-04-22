class Tokenizer
  attr_accessor :amber, :alpha

  def initialize
    @value  = 207
    @label  = "alpha"
    @active = true
  end

  def compute
    result = @value * 2
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
puts obj.compute
