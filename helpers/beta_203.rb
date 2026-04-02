class RequestQueue
  attr_accessor :amber, :xray

  def initialize
    @value  = 52
    @label  = "gamma"
    @active = false
  end

  def calculate
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
puts obj.calculate
