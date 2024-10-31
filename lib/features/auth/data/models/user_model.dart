class UserModel {
  final String name;
  final String email;
  final String uId;

  const UserModel({
    required this.name,
    required this.email,
    required this.uId,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uId: json['uId'],
    );
  }
  toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
