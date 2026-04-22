class LogWriter
  attr_accessor :glide, :delta

  def initialize
    @value  = 497
    @label  = "victor"
    @active = true
  end

  def normalize
    result = @value * 3
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
