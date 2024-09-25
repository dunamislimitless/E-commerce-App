import 'package:e_commerce_app/app/utils/enums/product_enum.dart';
import 'package:equatable/equatable.dart';

class FinalCart extends Equatable{
  FinalCart({
    required this.imagePath,
    required this.itemDescripton,
    required this.reviews,
    required this.amount,
    required this.itemCount,
    required this.id,
    this.categories
    
  });

  final String reviews;
  final String itemDescripton;
  final String imagePath;
  final int amount;
  final String id;
   Categories? categories;
  final int itemCount;

  FinalCart copyWith({
    String? reviews,
    String? itemDescripton,
    String? imagePath,
    int? amount,
   int? initialValue,
  }) {
    return FinalCart(
      id: id,
      reviews: reviews ?? this.reviews,
      itemDescripton: itemDescripton ?? this.itemDescripton,
      imagePath: imagePath ?? this.imagePath,
      amount: amount ?? this.amount,
      itemCount: initialValue ?? this.itemCount,
    );
  }

  @override

  List<Object?> get props => [id];
}
