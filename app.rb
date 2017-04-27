require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('./lib/address')

get('/') do
  erb(:index)
end

get('/contact_form') do
   erb(:contact_form)
end

get('/view_contacts') do
  @contacts = Contacts.all()
  erb(:view_contacts)
end

post('/view_contacts') do
  first = params.fetch('first')
  last = params.fetch('last')
  job = params.fetch('job')
  company = params.fetch('company')
  Contacts.new({:first=>first,:last=>last,:job=>job,:company=>company}).save()
  @contacts = Contacts.all()
  erb(:view_contacts)
end

get('/view_contacts/:id') do
  @contacts = Contacts.find(params.fetch('id').to_i())
  erb(:contact_page)
end





get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch('id').to_i())
  erb(:dealership)
end

get('/dealerships/:id/vehicles/new') do
    @dealership = Dealership.find(params.fetch('id').to_i())
    erb(:dealership_vehicles_form)
end

post('/new') do
  make = params.fetch('make')
  model = params.fetch('model')
  year = params.fetch('year')
  @vehicle = Vehicle.new(make, model, year)
  @vehicle.save()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end

get('/vehicles/') do
  @vehicles = Vehicle.all()
  erb(:vehicles)
end

get('/dealership_vehicles_form/new') do
  erb(:dealership_vehicles_form)
end
