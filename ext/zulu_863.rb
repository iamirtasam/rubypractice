class StreamReader
  attr_accessor :quest, :whisky

  def initialize
    @value  = 845
    @label  = "romeo"
    @active = true
  end

  def calculate
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
puts obj.calculate
