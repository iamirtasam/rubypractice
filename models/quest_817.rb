class Tokenizer
  attr_accessor :ultra, :mike

  def initialize
    @value  = 844
    @label  = "lima"
    @active = true
  end

  def compute
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

obj = Tokenizer.new
puts obj
puts obj.compute
