class RequestQueue
  attr_accessor :oscar, :romeo

  def initialize
    @value  = 181
    @label  = "blaze"
    @active = false
  end

  def transform
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
puts obj.transform
