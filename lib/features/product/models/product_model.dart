import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  final String productName;
  final String productDescription;
  final num productPrice;
  final String productImage;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json["product_name"] ?? "",
      productDescription: json["product_description"] ?? "",
      productPrice: json["product_price"] ?? 0,
      productImage: json["product_image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_image": productImage,
      };

  @override
  List<Object?> get props => [
        productName,
        productDescription,
        productPrice,
        productImage,
      ];
}
