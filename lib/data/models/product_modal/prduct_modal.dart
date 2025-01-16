class ProductModal {
  ProductModal(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images,
      required this.creationAt,
      required this.updatedAt,
      required this.category,
      required this.itemCount});

  final int id;
  final String title;
  final num price;
  final String description;
  final List<String> images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final Category? category;
  final num itemCount;

  ProductModal copyWith({num? itemCount}) {
    return ProductModal(
        id: id,
        title: title,
        price: price,
        description: description,
        images: images,
        creationAt: creationAt,
        updatedAt: updatedAt,
        category: category,
        itemCount: itemCount ?? this.itemCount);
  }

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
      itemCount: json["item_count"] ?? 0,
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
