# Practice: Modules and Mixins

module Greetable
  def greet
    "Hello, I am \#{self.class.name}: \#{to_s}"
  end

  def farewell
    "Goodbye from \#{self.class.name}"
  end
end

module Configurable
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
  include Greetable
  include Configurable

  attr_reader :comment

  def initialize(comment)
    @comment = comment
  end

  def to_s
    "\#{@comment}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@comment}"
  end
end

2.times do |i|
  obj = Inventory.new("comment_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "Inventory tracked actions: \#{Inventory.tracked_count}"
