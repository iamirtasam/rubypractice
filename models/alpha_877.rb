class RequestQueue
  attr_accessor :cedar, :frost

  def initialize
    @value  = 492
    @label  = "papa"
    @active = true
  end

  def digest
    result = @value * 8
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
puts obj.digest
