class StreamReader
  attr_accessor :india, :delta

  def initialize
    @value  = 623
    @label  = "blaze"
    @active = false
  end

  def resolve
    result = @value * 11
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
