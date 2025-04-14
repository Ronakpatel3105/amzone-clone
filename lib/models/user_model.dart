import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String phone;
  final Address address;

  const User({
    required this.id,
    required this.email,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });

  @override
  List<Object?> get props =>
      [id, email, username, firstName, lastName, phone, address];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      firstName: json['name']['firstname'],
      lastName: json['name']['lastname'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'name': {
        'firstname': firstName,
        'lastname': lastName,
      },
      'phone': phone,
      'address': address.toJson(),
    };
  }
}

class Address extends Equatable {
  final String city;
  final String street;
  final String zipcode;

  const Address({
    required this.city,
    required this.street,
    required this.zipcode,
  });

  @override
  List<Object?> get props => [city, street, zipcode];

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'],
      street: json['street'],
      zipcode: json['zipcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'street': street,
      'zipcode': zipcode,
    };
  }
}
