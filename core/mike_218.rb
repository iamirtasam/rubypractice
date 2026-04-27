class RequestQueue
  attr_accessor :beta, :lima

  def initialize
    @value  = 506
    @label  = "mike"
    @active = false
  end

  def validate
    result = @value * 14
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
puts obj.validate
