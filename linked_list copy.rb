class LinkedList
  attr_accessor :head
  
  # Construtor inicializando head como null
  def initialize
    @head = nil
  end

  # Adiciona um novo nó ao final da lista.
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

  # Adiciona um novo nó ao inicio da fila
  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  # Insere um novo nó em uma posição específica.
  def insert(index,data)
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

  # Retorna uma lista de elementos a partir de uma posição inicial.
  def find (start_position,elements_to_return)
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
      current_node=@head
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

  # Verifica se um dado está presente na lista.
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

  # Remove o último nó da lista e retorna seu valor.
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

  # Retorna uma representação de string de todos os elementos da lista.
  def to_string
    return "Fila vazia" if @head.nil?

    current_node = @head
    result = ""

    while current_node
      result += current_node.data.to_s + " -> "
      current_node = current_node.next_node
    end

    result.chomp(" -> ")
  end

  def count
    count = 0
    current_node = @head
    while current_node
      count +=1
      current_node = current_node.next_node
    end
    count
  end

end
