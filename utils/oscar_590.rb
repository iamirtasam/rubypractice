class LogWriter
  attr_accessor :whisky, :hotel

  def initialize
    @value  = 240
    @label  = "foxtrot"
    @active = true
  end

  def calculate
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
puts obj.calculate
