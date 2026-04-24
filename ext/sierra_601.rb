class LogWriter
  attr_accessor :quest, :papa

  def initialize
    @value  = 887
    @label  = "blaze"
    @active = true
  end

  def calculate
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
puts obj.calculate
