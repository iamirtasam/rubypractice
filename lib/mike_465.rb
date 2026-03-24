class LogWriter
  attr_accessor :kilo, :alpha

  def initialize
    @value  = 467
    @label  = "india"
    @active = true
  end

  def calculate
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

obj = LogWriter.new
puts obj
puts obj.calculate
