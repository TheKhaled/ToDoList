List<Map> DataOfAddress2 = [
  {
    'name': "Home",
    'address': "123 Main St",
    'city': "New York",
    'state': "NY",
    'zip': "10001",
    'country': "USA",
    "streat": "Al-Maadi Street"
  },
  {
    'name': "Work",
    'address': "456 Elm St",
    'city': "San Francisco",
    'state': "CA",
    'zip': "94101",
    'country': "USA",
    "streat": "Al-Maadi Street"
  },
  {
    'name': "School",
    'address': "789 Oak St",
    'city': "Los Angeles",
    'state': "CA",
    'zip': "90001",
    'country': "USA",
    "streat": "Al-Nile River Road Street"
  },
  {
    'name': "Home",
    'address': "456 Elm St",
    'city': "San Francisco",
    'state': "CA",
    'zip': "94101",
    'country': "USA",
    "streat": "Nile River Road"
  },
  {
    'name': "School",
    'address': "789 Oak St",
    'city': "Los Angeles",
    'state': "CA",
    'zip': "90001",
    'country': "USA",
    "streat": "Sunset Lane"
  },
  {
    'name': "Home",
    'address': "123 Main St",
    'city': "New York",
    'state': "NY",
    'zip': "10001",
    'country': "USA",
    "streat": "Pyramids Boulevard"
  },
];
//please  convert this  map to dart model

class Address {
  final String name;
  final String address;
  final String city;
  final String? state;
  final String zip;
  final String country;
  final String street;

  Address({
    required this.name,
    required this.address,
    required this.city,
    this.state,
    required this.zip,
    required this.country,
    required this.street,
  });

  // Factory constructor to create an Address object from a Map
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      country: json['country'],
      street: json['streat'], // Note: Corrected typo from "streat" to "street"
    );
  }

  // Method to convert Address object to a Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'state': state,
      'zip': zip,
      'country': country,
      'streat': street, // Note: Corrected typo from "streat" to "street"
    };
  }
}

List<Address> DataOfAddress = [
  Address(
      name: "Home",
      address: "Cairo , el tharir squre",
      city: "cairo",
      zip: "5252",
      country: "egypt",
      street: "Talet harb")
];
