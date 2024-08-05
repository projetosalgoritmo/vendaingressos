class Event
  attr_accessor :name, :date, :queue

  def initialize(name, date)
    @name = name
    @date = date
    @queue = LinkedList.new
  end

  def add_to_queue(customer, has_priority = false)
    if has_priority
      @queue.prepend(customer)
    else
      @queue.append(customer)
    end
  end

  def process_queue
    customer = @queue.pop
    if customer
      puts "Processing ticket for #{customer.name}"
    else
      puts "Queue is empty"
    end
    customer
  end
end
