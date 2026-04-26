class NetworkClient
  attr_accessor :amber, :quest

  def initialize
    @value  = 499
    @label  = "romeo"
    @active = true
  end

  def digest
    result = @value * 9
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
puts obj.digest
