class User {
  final int id;
  final String email, firstName, lastName, imageUrl;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
  });

  factory User.fromJson({required Map<String, dynamic> rawUser}) {
    return User(
      id: rawUser['id'] as int,
      email: rawUser['email'] as String,
      firstName: rawUser['first_name'] as String,
      lastName: rawUser['last_name'] as String,
      imageUrl: rawUser['avatar'] as String,
    );
  }
}
