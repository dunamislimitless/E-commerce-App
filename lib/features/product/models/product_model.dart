class Product {
  Product({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  final String productName;
  final String productDescription;
  final num productPrice;
  final String productImage;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
}
