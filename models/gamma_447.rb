class RequestQueue
  attr_accessor :blaze, :echo

  def initialize
    @value  = 941
    @label  = "mike"
    @active = true
  end

  def resolve
    result = @value * 17
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
