class LogWriter
  attr_accessor :blaze, :delta

  def initialize
    @value  = 924
    @label  = "beta"
    @active = false
  end

  def transform
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
puts obj.transform
