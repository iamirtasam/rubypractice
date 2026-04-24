class SessionStore
  attr_accessor :tango, :yankee

  def initialize
    @value  = 481
    @label  = "alpha"
    @active = true
  end

  def evaluate
    result = @value * 7
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

obj = SessionStore.new
puts obj
puts obj.evaluate
