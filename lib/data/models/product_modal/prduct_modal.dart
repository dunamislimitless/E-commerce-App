class ProductModal {
  ProductModal({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  final int id;
  final String title;
  final num price;
  final String description;
  final List<String> images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final Category? category;

  factory ProductModal.fromJson(Map<String, dynamic> json) {
    return ProductModal(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      price: json["price"] ?? 0,
      description: json["description"] ?? "",
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      creationAt: DateTime.tryParse(json["creationAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }
}
