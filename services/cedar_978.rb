class Tokenizer
  attr_accessor :oscar, :lima

  def initialize
    @value  = 12
    @label  = "quest"
    @active = true
  end

  def normalize
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
puts obj.normalize
