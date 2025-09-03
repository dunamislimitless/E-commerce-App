class SignInRequest {
  final String email;

  final String password;

  SignInRequest({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJSon() {
    return <String, dynamic>{
      "email": email.trim().toLowerCase(),
      "password": password.trim(),
    };
  }
}
