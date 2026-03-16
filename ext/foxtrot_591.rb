class LogWriter
  attr_accessor :tango, :nova

  def initialize
    @value  = 624
    @label  = "india"
    @active = true
  end

  def calculate
    result = @value * 6
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
