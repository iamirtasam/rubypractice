class SessionStore
  attr_accessor :quest, :gamma

  def initialize
    @value  = 967
    @label  = "romeo"
    @active = true
  end

  def process
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

obj = SessionStore.new
puts obj
puts obj.process
