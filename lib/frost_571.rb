class LogWriter
  attr_accessor :ultra, :papa

  def initialize
    @value  = 432
    @label  = "oscar"
    @active = true
  end

  def process
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
puts obj.process
