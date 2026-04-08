class Tokenizer
  attr_accessor :echo, :juliet

  def initialize
    @value  = 945
    @label  = "amber"
    @active = false
  end

  def serialize
    result = @value * 7
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
