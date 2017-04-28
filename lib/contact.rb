


class Contacts
  @@contact_array = []
  attr_reader(:first,:last,:job,:company)
  define_method(:initialize) do |attribute|
    @first = attribute.fetch(:first)
    @last = attribute.fetch(:last)
    @job = attribute.fetch(:job)
    @company = attribute.fetch(:company)
    @id = @@contact_array.length().+(1)
    @address=[]

end



  define_singleton_method(:all) do
    @@contact_array
  end

define_method(:id)do
    @id
   end


  define_method(:save) do
    @@contact_array.push(self)
  end

  define_singleton_method(:clear) do
    @@contact_array = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contact_array.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
      end
        found_contact
    end

  end
