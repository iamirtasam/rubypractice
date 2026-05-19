# Practice: Modules and Mixins

module Serializable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Observable
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

class Inventory
  include Serializable
  include Observable

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def to_s
    "\#{@message}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@message}"
  end
end

2.times do |i|
  obj = Inventory.new("message_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "Inventory tracked actions: \#{Inventory.tracked_count}"
