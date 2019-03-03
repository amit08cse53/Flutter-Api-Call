// https://app.quicktype.io/
// To parse this JSON data, do
//
//     final contactModel = contactModelFromJson(jsonString);

import 'dart:convert';

ContactModel contactModelFromJson(String str) {
  final jsonData = json.decode(str);
  return ContactModel.fromJson(jsonData);
}

String contactModelToJson(ContactModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class ContactModel {
  List<Contact> contacts;

  ContactModel({
    this.contacts,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => new ContactModel(
    contacts: json["contacts"] == null ? null : new List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "contacts": contacts == null ? null : new List<dynamic>.from(contacts.map((x) => x.toJson())),
  };
}

class Contact {
  String id;
  String name;
  String email;
  String address;
  String gender;
  Phone phone;

  Contact({
    this.id,
    this.name,
    this.email,
    this.address,
    this.gender,
    this.phone,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => new Contact(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    address: json["address"] == null ? null : json["address"],
    gender: json["gender"] == null ? null : json["gender"],
    phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "address": address == null ? null : address,
    "gender": gender == null ? null : gender,
    "phone": phone == null ? null : phone.toJson(),
  };
}

class Phone {
  String mobile;
  String home;
  String office;

  Phone({
    this.mobile,
    this.home,
    this.office,
  });

  factory Phone.fromJson(Map<String, dynamic> json) => new Phone(
    mobile: json["mobile"] == null ? null : json["mobile"],
    home: json["home"] == null ? null : json["home"],
    office: json["office"] == null ? null : json["office"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile == null ? null : mobile,
    "home": home == null ? null : home,
    "office": office == null ? null : office,
  };
}