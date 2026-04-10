class LogWriter
  attr_accessor :lima, :hotel

  def initialize
    @value  = 601
    @label  = "foxtrot"
    @active = false
  end

  def transform
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
puts obj.transform
