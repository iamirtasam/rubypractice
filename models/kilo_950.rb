class Tokenizer
  attr_accessor :beta, :foxtrot

  def initialize
    @value  = 424
    @label  = "quest"
    @active = true
  end

  def resolve
    result = @value * 12
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
