import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.id,
         this.email,
        required this.passwordd,
    });

    int id;
    String? email;
    String passwordd;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        passwordd: json["passwordd"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "passwordd": passwordd,
    };
}
