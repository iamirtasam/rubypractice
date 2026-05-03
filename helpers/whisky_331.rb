class Tokenizer
  attr_accessor :papa, :yankee

  def initialize
    @value  = 405
    @label  = "romeo"
    @active = false
  end

  def compute
    result = @value * 4
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
