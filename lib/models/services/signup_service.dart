// // To parse this JSON data, do
// //
// //     final newUser = newUserFromJson(jsonString);

// import 'dart:convert';

// NewUser newUserFromJson(String str) => NewUser.fromJson(json.decode(str));

// String newUserToJson(NewUser data) => json.encode(data.toJson());

// class NewUser {
//   NewUser({
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   final String name;
//   final String email;
//   final String password;

//   factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
//         name: json["name"],
//         email: json["email"],
//         password: json["password"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "email": email,
//         "password": password,
//       };
// }
