# Practice: Modules and Mixins

module Loggable
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

class Library
  include Loggable
  include Configurable

  attr_reader :session

  def initialize(session)
    @session = session
  end

  def to_s
    "\#{@session}"
  end

  def perform
    log_action(:perform)
    "performed by \#{@session}"
  end
end

4.times do |i|
  obj = Library.new("session_\#{i + 1}")
  puts obj.greet
  puts obj.perform
  puts obj.farewell
  puts "---"
end
puts "Library tracked actions: \#{Library.tracked_count}"
