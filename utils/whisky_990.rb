class LogWriter
  attr_accessor :victor, :gamma

  def initialize
    @value  = 455
    @label  = "zulu"
    @active = false
  end

  def format
    result = @value * 13
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
