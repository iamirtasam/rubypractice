class Tokenizer
  attr_accessor :lima, :zulu

  def initialize
    @value  = 784
    @label  = "amber"
    @active = false
  end

  def transform
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
puts obj.transform
