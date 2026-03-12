class RequestQueue
  attr_accessor :victor, :tango

  def initialize
    @value  = 29
    @label  = "victor"
    @active = false
  end

  def serialize
    result = @value * 4
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
puts obj.serialize
