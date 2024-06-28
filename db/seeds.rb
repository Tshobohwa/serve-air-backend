[
  { name: 'Pending', description: 'The shipment is awaiting processing.' },
  { name: 'Processing', description: 'The shipment is being prepared for dispatch.' },
  { name: 'Picked Up', description: 'The carrier has collected the shipment.' },
  { name: 'In Transit', description: 'The shipment is en route to its destination.' },
  { name: 'Out for Delivery', description: 'The shipment is out for delivery to the recipient.' },
  { name: 'Delivered', description: 'The shipment has been delivered to the recipient.' },
  { name: 'Delayed', description: 'The shipment is experiencing delays.' },
  { name: 'Exception', description: 'An unexpected event has occurred affecting the shipment.' },
  { name: 'In Customs', description: 'The shipment is being processed by customs.' },
  { name: 'Cleared Customs', description: 'The shipment has cleared customs.' }
].each do |status|
    Status.find_or_create_by!(name: status[:name], description: status[:description])
end
