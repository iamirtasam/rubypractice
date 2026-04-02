class ConfigLoader
  attr_accessor :romeo, :glide

  def initialize
    @value  = 941
    @label  = "frost"
    @active = false
  end

  def resolve
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

obj = ConfigLoader.new
puts obj
puts obj.resolve
