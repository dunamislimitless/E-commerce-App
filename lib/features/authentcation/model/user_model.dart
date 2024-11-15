class UserModel {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? phoneNumber;
  final String? userId;
  final String? occupation;
  final DateTime? createdAt;

  UserModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.occupation,
    this.phoneNumber,
    this.userId,
    this.createdAt,
  });

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? phoneNumber,
    String? occupation,
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
        occupation: occupation ?? this.occupation,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        userId: json["user_id"],
        occupation: json["occupation"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "occupation": occupation,
        "phone_number": phoneNumber,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
      };
}
