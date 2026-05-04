class RequestQueue
  attr_accessor :ultra, :beta

  def initialize
    @value  = 741
    @label  = "ember"
    @active = true
  end

  def compute
    result = @value * 20
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
