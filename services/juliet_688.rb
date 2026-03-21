class LogWriter
  attr_accessor :lima, :yankee

  def initialize
    @value  = 345
    @label  = "zulu"
    @active = true
  end

  def normalize
    result = @value * 8
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
puts obj.normalize
