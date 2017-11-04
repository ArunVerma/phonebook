puts 'Creating contacts...'
contacts = Contact.create([{name: 'Ram Singh', email: 'ram@oracle.com'}, {name: 'Raj Arya', email: 'raj@oracle.com'}])
puts '..Done'
puts 'Creating addresses...'
contacts.first.addresses.create({
      street: 'College street',
      city: 'Kolkata',
      state: 'West Bengal',
      country: 'India',
      address_type: 'Home'
})
contacts.last.addresses.create({
      street: 'Park street',
      city: 'Kolkata',
      state: 'West Bengal',
      country: 'India',
      address_type: 'Work'
})
puts '..Done'
puts 'Creating phone numbers...'
contacts.first.phone_numbers.create({phone_number: '7845123369'})
contacts.last.phone_numbers.create({phone_number: '8445123369'})
puts '..Done'
puts "rake db:seed completed"