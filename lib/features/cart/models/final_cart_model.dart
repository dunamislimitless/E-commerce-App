import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:equatable/equatable.dart';

class FinalCart extends Equatable {
  FinalCart(
      {required this.amount,
      required this.id,
      required this.imagePath,
      required this.itemCount,
      required this.itemDescription,
      required this.reviews,
      this.timeCreated,
      this.categories});

  final num amount;
  final String id;
  final String imagePath;
  final num itemCount;
  final String itemDescription;
  final String reviews;
  final DateTime? timeCreated;
  Categories? categories;

  FinalCart copyWith({
    num? amount,
    String? id,
    String? imagePath,
    String? itemDescription,
    String? reviews,
    num? itemCount,
    DateTime? timeCreated,
    Categories? categories,
  }) {
    return FinalCart(
      amount: amount ?? this.amount,
      id: id ?? this.id,
      categories: categories ?? this.categories,
      imagePath: imagePath ?? this.imagePath,
      itemCount: itemCount ?? this.itemCount,
      itemDescription: itemDescription ?? this.itemDescription,
      reviews: reviews ?? this.reviews,
      timeCreated: timeCreated ?? this.timeCreated,
    );
  }

  factory FinalCart.fromJson(Map<String, dynamic> json) {
    return FinalCart(
      amount: json["amount"] ?? 0,
      id: json["id"] ?? "",
      categories: json["categories"] ?? "",
      imagePath: json["image_path"] ?? "",
      itemCount: json["item_count"] ?? 0,
      itemDescription: json["item_description"] ?? "",
      reviews: json["reviews"] ?? "",
      timeCreated: DateTime.tryParse(json["time_created"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "id": id,
        "image_path": imagePath,
        "item_count": itemCount,
        "categories": categories,
        "item_description": itemDescription,
        "reviews": reviews,
        "time_created": timeCreated?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id];
}
