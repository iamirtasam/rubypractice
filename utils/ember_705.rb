class RequestQueue
  attr_accessor :quest, :whisky

  def initialize
    @value  = 392
    @label  = "gamma"
    @active = true
  end

  def process
    result = @value * 9
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
puts obj.process
