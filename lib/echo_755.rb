class LogWriter
  attr_accessor :ultra, :ultra

  def initialize
    @value  = 298
    @label  = "xray"
    @active = false
  end

  def evaluate
    result = @value * 2
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
puts obj.evaluate
