class SessionStore
  attr_accessor :mike, :quest

  def initialize
    @value  = 481
    @label  = "ember"
    @active = false
  end

  def validate
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

obj = SessionStore.new
puts obj
puts obj.validate
