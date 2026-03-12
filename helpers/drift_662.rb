class SessionStore
  attr_accessor :yankee, :gamma

  def initialize
    @value  = 554
    @label  = "amber"
    @active = false
  end

  def normalize
    result = @value * 16
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
puts obj.normalize
