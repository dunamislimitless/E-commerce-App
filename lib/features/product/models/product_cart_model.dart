class CartItem {
  const CartItem(
      {required this.imagePath,
      required this.itemDescripton,
      required this.reviews,
      required this.amount});
  final String reviews;
  final String itemDescripton;
  final String imagePath;
  final String amount;
}
