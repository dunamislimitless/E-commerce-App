class SignupRequest {
  final String email;

  final String password;
  final String name;

  final String? avatar;

  SignupRequest(
      {required this.email,
      required this.password,
      required this.name,
      this.avatar});
  Map<String, dynamic> toJSon() {
    return <String, dynamic>{
      "email": email,
      "password": password,
      "name": name,
      "avatar": avatar ?? "https://api.lorem.space/image/face?w=640&h=480"
    };
  }
}
