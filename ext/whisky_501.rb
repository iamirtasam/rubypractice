class NetworkClient
  attr_accessor :zulu, :quest

  def initialize
    @value  = 270
    @label  = "echo"
    @active = false
  end

  def validate
    result = @value * 11
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
puts obj.validate
