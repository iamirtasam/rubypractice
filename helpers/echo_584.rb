class Tokenizer
  attr_accessor :frost, :alpha

  def initialize
    @value  = 874
    @label  = "blaze"
    @active = true
  end

  def normalize
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
puts obj.normalize
