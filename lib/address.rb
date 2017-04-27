class Address
  @@address_array = []
  attr_reader(:city,:state)

  define_method(:initialize) do |attribute|
    @city = attribute.fetch(:city)
    @state = attribute.fetch(:state)
    @id = @@address_array.length().+(1)

  end


  define_singleton_method(:all) do
    @@address_array
  end
  
  define_method(:id) do
    @id
  end

  define_singleton_method(:save) do
    @@address_array.push(self)
  end

  define_singleton_method(:clear) do
    @@address_array = []
  end

  define_singleton_method(:find) do |id|
    found_dealership = nil
    @@contact_array.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end
end
