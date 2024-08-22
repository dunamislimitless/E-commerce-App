class FinalCart {
  FinalCart({
    required this.imagePath,
    required this.itemDescripton,
    required this.reviews,
    required this.amount,
    required this.initialValue,
  });

  final String reviews;
  final String itemDescripton;
  final String imagePath;
  final String amount;
  final String initialValue;

  FinalCart copyWith({
    String? reviews,
    String? itemDescripton,
    String? imagePath,
    String? amount,
    String? initialValue,
  }) {
    return FinalCart(
      reviews: reviews ?? this.reviews,
      itemDescripton: itemDescripton ?? this.itemDescripton,
      imagePath: imagePath ?? this.imagePath,
      amount: amount ?? this.amount,
      initialValue: initialValue ?? this.initialValue,
    );
  }
}
