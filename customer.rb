class Customer
  attr_accessor :name, :cpf, :address, :birth_date, :billing_info

  def initialize(name, cpf, address = "", birth_date = "", billing_info = "")
    @name = name
    @cpf = cpf
    @address = address
    @birth_date = birth_date
    @billing_info = billing_info
  end

  def to_s
    "#{name} (CPF: #{cpf})"
  end
end
