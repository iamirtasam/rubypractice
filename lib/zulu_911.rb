class RequestQueue
  attr_accessor :tango, :glide

  def initialize
    @value  = 347
    @label  = "xray"
    @active = true
  end

  def evaluate
    result = @value * 11
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

obj = RequestQueue.new
puts obj
puts obj.evaluate
