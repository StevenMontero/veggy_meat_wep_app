import 'package:veggy/data/production/repositories/product_repository.dart';
import 'package:veggy/domain/models/product_api.dart';

class ProductUseCase {
  final _productsRepo = ProductRepository();

  Future<List<ProductApi>> getProductsByCateforie(String category) {
    return _productsRepo.getProductsByCategory(category, '000073');
  }

  Future<List<ProductApi>> searchProductsByCategory(
      String category, String searchParameter) {
    return _productsRepo.searchProductsByCategory(category, searchParameter);
  }
}
