class LogWriter
  attr_accessor :quest, :tango

  def initialize
    @value  = 653
    @label  = "lima"
    @active = false
  end

  def digest
    result = @value * 15
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
puts obj.digest
