import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:e_commerce_app/data/models/product_modal/prduct_modal.dart';
import 'package:e_commerce_app/domain/repository/product.dart';
import 'package:e_commerce_app/service_locator.dart';

class GetCaregoryUsecase implements UseCase<void, List<Category>> {
  @override
  Future<List<Category>> call({void param}) {
    return s1<ProductRepository>().getProductCategory();
  }
}
