class ConfigLoader
  attr_accessor :papa, :india

  def initialize
    @value  = 83
    @label  = "zulu"
    @active = false
  end

  def digest
    result = @value * 3
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

obj = ConfigLoader.new
puts obj
puts obj.digest
