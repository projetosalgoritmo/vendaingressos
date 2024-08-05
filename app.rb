require 'sinatra'
require_relative 'event'
require_relative 'customer'
require_relative 'linked_list'
require_relative 'node'

# Dados globais para armazenar eventos e clientes
$events = []

# Página inicial
get '/' do
  erb :index
end

# Página de cadastro de eventos
get '/event' do
  erb :event
end

post '/event' do
  event_name = params[:name]
  event_date = params[:date]
  $event = Event.new(event_name, event_date)
  $events << $event
  redirect '/'
end

# Página de cadastro de clientes
get '/customer' do
  @events = $events
  erb :customer
end

post '/customer' do
  customer_name = params[:name]
  customer_cpf = params[:cpf]
  event_index = params[:event].to_i
  priority = params[:priority] == 'on'
  customer = Customer.new(customer_name, customer_cpf)
  $events[event_index].add_to_queue(customer, priority)
  redirect '/'
end

# Página para visualizar a fila
get '/queue' do
  @events = $events
  erb :queue
end

post '/queue' do
  event_index = params[:event].to_i
  $events[event_index].process_queue
  redirect '/queue'
end
