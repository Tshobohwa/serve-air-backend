[
  { name: 'Pending', description: 'The package has been received at the shipping facility and is awaiting further processing.' },
  { name: 'Processed', description: 'The package has been sorted and prepared for shipment, and tracking information has been updated.' },
  { name: 'In Transit', description: 'The package is en route to its destination, traveling through the necessary shipping channels.' },
  { name: 'Received', description: 'The package has been successfully received in the recipient city.' },
  { name: 'Delivered', description: 'The package has been successfully delivered to the recipient.' },
  { name: 'Lost', description: 'The package could not be delivered and is now considered lost during shipment.' }
].each do |status|
    Status.find_or_create_by!(name: status[:name], description: status[:description])
end
