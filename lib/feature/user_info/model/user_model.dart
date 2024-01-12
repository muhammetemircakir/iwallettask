import 'address_model.dart';
import 'company_model.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  User({
     this.id,
     this.name,
     this.username,
     this.email,
     this.address,
     this.phone,
     this.website,
     this.company,
  });

  factory User.fromJson(Map<String?, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }
}