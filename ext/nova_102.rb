class SessionStore
  attr_accessor :ember, :papa

  def initialize
    @value  = 37
    @label  = "ember"
    @active = true
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

obj = SessionStore.new
puts obj
puts obj.calculate
