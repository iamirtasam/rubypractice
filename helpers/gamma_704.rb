class LogWriter
  attr_accessor :blaze, :cedar

  def initialize
    @value  = 773
    @label  = "drift"
    @active = true
  end

  def calculate
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

obj = LogWriter.new
puts obj
puts obj.calculate
