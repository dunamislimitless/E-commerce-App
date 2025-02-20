class UserModellls {
  UserModellls({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
  });

  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  factory UserModellls.fromJson(Map<String, dynamic> json) {
    return UserModellls(
      id: json["id"] ?? 0,
      email: json["email"] ?? "",
      password: json["password"] ?? "",
      name: json["name"] ?? "",
      role: json["role"] ?? "",
      avatar: json["avatar"] ?? "",
    );
  }
}
