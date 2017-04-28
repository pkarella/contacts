require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')


get('/') do
  erb(:index)
end

get('/view_contact')do
@contacts = Contacts.all()
  erb(:view_contact)
end

get('/view_contact/new') do
  erb(:contact_form)
end

post('/view_contact') do
  first = params.fetch('first')
  last = params.fetch('last')
  job = params.fetch('job')
  company = params.fetch('company')
  Contacts.new({:first=>first,:last=>last,:job=>job,:company=>company}).save()
  @contacts = Contacts.all()
  erb(:view_contact)
end



get('/view_contact/:id') do
  @contacts = Contacts.find(params.fetch('id').to_i())
  erb(:contact_page)
end


post('/contact_page') do
  

end
