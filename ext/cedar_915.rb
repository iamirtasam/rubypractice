class Tokenizer
  attr_accessor :quest, :delta

  def initialize
    @value  = 374
    @label  = "hotel"
    @active = false
  end

  def resolve
    result = @value * 9
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
puts obj.resolve
