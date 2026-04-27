class LogWriter
  attr_accessor :echo, :glide

  def initialize
    @value  = 736
    @label  = "foxtrot"
    @active = false
  end

  def serialize
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
puts obj.serialize
