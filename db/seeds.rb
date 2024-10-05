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

[
  { city: "Kinshasa", territory: "Kinshasa", province: "Kinshasa" },
  { city: "Goma", territory: "Goma", province: "North Kivu" },
  { city: "Lubumbashi", territory: "Lubumbashi", province: "Haut-Katanga" },
  { city: "Kananga", territory: "Kananga", province: "Kasaï-Central" },
  { city: "Kisangani", territory: "Kisangani", province: "Tshopo" },
  { city: "Mbuji-Mayi", territory: "Mbuji-Mayi", province: "Kasaï-Oriental" },
  { city: "Kindu", territory: "Kindu", province: "Maniema" },
  { city: "Gemena", territory: "Gemena", province: "Sud-Ubangi" },
  { city: "Kikwit", territory: "Kikwit", province: "Kwilu" },
  { city: "Mwene-Ditu", territory: "Mwene-Ditu", province: "Lomami" },
  { city: "Butembo", territory: "Butembo", province: "North Kivu" },
  { city: "Bumba", territory: "Bumba", province: "Mongala" },
  { city: "Boende", territory: "Boende", province: "Tshuapa" },
  { city: "Isiro", territory: "Isiro", province: "Haut-Uele" },
  { city: "Bukavu", territory: "Bukavu", province: "South Kivu" },
  { city: "Kolwezi", territory: "Kolwezi", province: "Lualaba" },
  { city: "Tshikapa", territory: "Tshikapa", province: "Kasaï" },
  { city: "Lisala", territory: "Lisala", province: "Mongala" },
  { city: "Matadi", territory: "Matadi", province: "Kongo-Central" },
  { city: "Kalemie", territory: "Kalemie", province: "Tanganyika" },
  { city: "Kamina", territory: "Kamina", province: "Haut-Lomami" },
  { city: "Mbandaka", territory: "Mbandaka", province: "Équateur" },
  { city: "Ilebo", territory: "Ilebo", province: "Kasaï" },
  { city: "Beni", territory: "Beni", province: "North Kivu" },
  { city: "Bunia", territory: "Bunia", province: "Ituri" },
  { city: "Inongo", territory: "Inongo", province: "Mai-Ndombe" },
  { city: "Lodja", territory: "Lodja", province: "Sankuru" }
].each do |address|
  @address = Address.find_or_create_by!(city: address[:city], territory: address[:territory], province: address[:province])
  Origin.find_or_create_by!({address_id: @address.id})
  Destination.find_or_create_by!({address_id: @address.id})
end
