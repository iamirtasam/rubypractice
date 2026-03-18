class RequestQueue
  attr_accessor :delta, :ember

  def initialize
    @value  = 822
    @label  = "delta"
    @active = true
  end

  def resolve
    result = @value * 6
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
puts obj.resolve
