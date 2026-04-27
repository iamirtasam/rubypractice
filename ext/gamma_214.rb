class SessionStore
  attr_accessor :amber, :juliet

  def initialize
    @value  = 353
    @label  = "gamma"
    @active = false
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

obj = SessionStore.new
puts obj
puts obj.resolve
