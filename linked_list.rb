class Node
  attr_accessor :data, :next_node

  def initialize(data)
    @data = data
    @next_node = nil
  end
end

class LinkedList
  attr_accessor :head
  
  def initialize
    @head = nil
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
    else
      current = @head
      while current.next_node != nil
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  def insert(index, data)
    linked_list_length = 0
    length_check_start_node = @head
    while length_check_start_node != nil
      linked_list_length += 1
      length_check_start_node = length_check_start_node.next_node
    end
    if index > linked_list_length
      return "The list is only #{linked_list_length} nodes long."
    else
      current_node = @head
      (index-1).times do
        current_node = current_node.next_node
      end
      new_node = Node.new(data)
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def find(start_position, elements_to_return)
    linked_list_length = 0
    length_check_start_node = @head
    while length_check_start_node != nil
      linked_list_length += 1
      length_check_start_node = length_check_start_node.next_node
    end

    if elements_to_return > linked_list_length
      return "The list is only #{linked_list_length} nodes long."
    else
      elements = []
      current_node = @head
      (start_position).times do
        current_node = current_node.next_node
      end
      elements_to_return.times do
        elements << current_node.data
        current_node = current_node.next_node
      end
      elements
    end
  end

  def includes?(data)
    current_node = @head
    while current_node
      if current_node.data == data
        return true
      end
      current_node = current_node.next_node
    end
    false
  end

  def pop
    return nil if @head.nil?
    
    if @head.next_node.nil?
      data = @head.data
      @head = nil
      return data
    end
    
    current_node = @head
    while current_node.next_node.next_node
      current_node = current_node.next_node
    end
    data = current_node.next_node.data
    current_node.next_node = nil
    data
  end

  def to_array
    return [] if @head.nil?

    elements = []
    current_node = @head
    while current_node
      elements << current_node.data
      current_node = current_node.next_node
    end
    elements
  end

  def count
    count = 0
    current_node = @head
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end
end
