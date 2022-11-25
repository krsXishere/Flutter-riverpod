class UserModel {
  int id;
  String email, firstName, lastName, avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> object) {
    return UserModel(
      id: object['id'],
      email: object['email'],
      firstName: object['first_name'],
      lastName: object['last_name'],
      avatar: object['avatar'],
    );
  }
}
