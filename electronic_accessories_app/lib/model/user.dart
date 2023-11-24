class User {
  String? name;
  String? email;
  String? password;
  String? role;
  User({
    this.email,
    this.name,
    this.password,
    this.role,
  });
// get the data from the server
  factory User.fromJson(Map<String, dynamic> json) => User(
      email: json["email"],
      name: json["name"],
      password: json["password"],
      role: json["role"]);
// send the data of json object
  Map<String, dynamic> toJson() => {
        "email": email,
        // "address": address,

        "name": name,
        "password": password,
        "role": role

        // "country": country
      };
}
