class UserModel {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? phoneNumber;
  final String? userId;
  final DateTime? createdAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.phoneNumber,
    this.userId,
    this.createdAt,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? phoneNumber,
    String? userId,
    DateTime? createdAt,
  }) =>
      UserModel(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        userId: userId ?? this.userId,
        createdAt: createdAt ?? this.createdAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "phone_number": phoneNumber,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
      };
}
