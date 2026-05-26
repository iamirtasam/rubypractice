# Practice: Modules and Mixins

module Greetable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Trackable
  def self.included(base)
    base.instance_variable_set(:@tracked_count, 0)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def track!
      @tracked_count = (@tracked_count || 0) + 1
    end

    def tracked_count
      @tracked_count || 0
    end
  end

  def log_action(action)
    self.class.track!
    puts "[LOG] \#{self.class.name}#\#{action} called (total: \#{self.class.tracked_count})"
  end
end

class ShoppingCart
  include Greetable
  include Trackable

  attr_reader :record

  def initialize(record)
    @record = record
  end

  def to_s
    "\#{@record}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@record}"
  end
end

2.times do |i|
  obj = ShoppingCart.new("record_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "ShoppingCart tracked actions: \#{ShoppingCart.tracked_count}"
