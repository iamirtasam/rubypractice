class NetworkClient
  attr_accessor :nova, :quest

  def initialize
    @value  = 664
    @label  = "juliet"
    @active = true
  end

  def serialize
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

obj = NetworkClient.new
puts obj
puts obj.serialize
