class SignupRequest {
  final String email;
  final String password;
  final String name;
  final String? avatar;
  final String? role;

  SignupRequest(
      {required this.email,
      required this.password,
      required this.name,
      this.avatar,
      this.role});

  Map<String, dynamic> toJSon() {
    return <String, dynamic>{
      "email": email.trim().toLowerCase(),
      "password": password.trim(),
      "name": name,
      "role": role ?? "customer",
      "avatar": avatar ?? "https://i.imgur.com/LDOO4Qs.jpg",
    };
  }
}
