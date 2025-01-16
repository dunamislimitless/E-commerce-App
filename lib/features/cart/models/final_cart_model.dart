import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:equatable/equatable.dart';

class FinalCart extends Equatable {
  FinalCart({
    required this.amount,
    required this.id,
    required this.imagePath,
    required this.itemCount,
    required this.itemDescription,
    required this.reviews,
    this.timeCreated,
    this.category,
    //this.categories
  });

  final num amount;
  final String id;
  final String imagePath;
  final num itemCount;
  final String itemDescription;
  final String reviews;
  final DateTime? timeCreated;
  // Categories? categories;
  String? category;

  FinalCart copyWith({
    num? amount,
    String? id,
    String? imagePath,
    String? itemDescription,
    String? reviews,
    num? itemCount,
    DateTime? timeCreated,
    //  Categories? categories,
    String? category,
  }) {
    return FinalCart(
      amount: amount ?? this.amount,
      id: id ?? this.id,
      category: category ?? this.category,
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
      category: json["categories"] ?? "",
      imagePath: json["image_path"] ?? "",
      itemCount: json["item_count"] ?? 0,
      itemDescription: json["item_description"] ?? "",
      reviews: json["reviews"] ?? "",
      timeCreated: (json['time_created']).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "id": id,
        "image_path": imagePath,
        "item_count": itemCount,
        "categories": category,
        "item_description": itemDescription,
        "reviews": reviews,
        "time_created": timeCreated?.toIso8601String(),
      };

  @override
  List<Object?> get props => [id];
}
