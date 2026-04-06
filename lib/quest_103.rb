class LogWriter
  attr_accessor :yankee, :cedar

  def initialize
    @value  = 698
    @label  = "kilo"
    @active = false
  end

  def format
    result = @value * 16
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
puts obj.format
