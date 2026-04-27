class RequestQueue
  attr_accessor :cedar, :blaze

  def initialize
    @value  = 191
    @label  = "oscar"
    @active = true
  end

  def compute
    result = @value * 12
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
puts obj.compute
