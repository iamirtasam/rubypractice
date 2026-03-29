class RequestQueue
  attr_accessor :kilo, :alpha

  def initialize
    @value  = 511
    @label  = "ember"
    @active = true
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

obj = RequestQueue.new
puts obj
puts obj.format
