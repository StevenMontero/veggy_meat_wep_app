import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/domain/models/product_detail.dart';
import 'package:veggy/domain/usecases/local_product_db_usecase.dart';
import 'package:veggy/domain/usecases/products_usecase.dart';
import 'package:veggy/util/regularExpressions/number_no_empty.dart';
part 'counterquantity_state.dart';

class DeatailCubit extends Cubit<DetailState> {
  DeatailCubit()
      : super(DetailState(productApi: ProductApi()));
  final _productUseCase = ProductUseCase();
  final _localDb = ProductSateLocalUseCase();
  void addProductQuatity() {
    emit(state.copyWith(quantityUnits: state.quantityUnits + 1));
  }

  void removeProductQuatity() {
    emit(state.copyWith(
        quantityUnits: state.quantityUnits <= 0
            ? state.quantityUnits
            : state.quantityUnits - 1));
  }

  void productQuatityGranelChanged(String quatity) {
    emit(state.copyWith(quantityGranel: NumberNoEmpty.dirty(quatity)));
  }

  void productChanged(String category, String id) async {
    final _productSateLocal = await _localDb.getProductStateLocalDB();
    if (_productSateLocal == null) {
      final _product =
          await _productUseCase.getOneProductsByCateforie(category, id);
      emit(state.copyWith(productApi: _product));
    } else {
      print(_productSateLocal.sameListProduct[0]);
      emit(state.copyWith(
          productApi: _productSateLocal.product,
          listSameProduct: _productSateLocal.sameListProduct));
    }
  }

  void productLoad(ProductDetail productApi) async {
    _localDb.saveProductStateLocalDB(productApi);
    emit(state.copyWith(
        productApi: productApi.product,
        listSameProduct: productApi.sameListProduct));
  }
}
