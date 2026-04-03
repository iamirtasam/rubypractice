class StreamReader
  attr_accessor :gamma, :whisky

  def initialize
    @value  = 486
    @label  = "ultra"
    @active = true
  end

  def resolve
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

obj = StreamReader.new
puts obj
puts obj.resolve
