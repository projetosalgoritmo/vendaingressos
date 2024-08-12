require 'sinatra'
require_relative 'event'
require_relative 'customer'
require_relative 'linked_list'
require_relative 'node'

# Dados globais para armazenar eventos e clientes
$events = []

# Página Welcome

get '/' do
  erb :welcome
end

# Página inicial

get '/home' do
  erb :index
end

get '/info' do
  erb :info
end

# Página de cadastro de eventos
get '/event' do
  erb :event
end

post '/event' do
  event_name = params[:name]
  event_date = params[:date]
  event_hour = params[:hour]
  event_category = params[:category]
  $event = Event.new(event_name, event_date, event_hour, event_category)
  $events << $event
  redirect '/home'
end

# Página de cadastro de clientes
get '/customer' do
  @events = $events
  erb :customer
end

get '/participante' do
  @events = $events
  erb :participante
end


post '/customer' do
  customer_name = params[:name]
  customer_cpf = params[:cpf]
  customer_address = params[:address]
  customer_birth_date = params[:birth_date]
  event_index = params[:event].to_i
  priority = params[:priority] == 'on'
  customer = Customer.new(customer_name, customer_cpf, customer_address, customer_birth_date)
  $events[event_index].add_to_queue(customer, priority)
  redirect '/home'
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
