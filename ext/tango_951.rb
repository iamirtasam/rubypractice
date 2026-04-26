class NetworkClient
  attr_accessor :xray, :oscar

  def initialize
    @value  = 609
    @label  = "foxtrot"
    @active = false
  end

  def serialize
    result = @value * 2
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
