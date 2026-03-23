class LogWriter
  attr_accessor :india, :quest

  def initialize
    @value  = 85
    @label  = "cedar"
    @active = false
  end

  def parse
    result = @value * 10
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
puts obj.parse
