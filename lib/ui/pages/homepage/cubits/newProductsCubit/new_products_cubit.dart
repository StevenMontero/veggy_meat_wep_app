import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggy/domain/models/newProduts.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/domain/usecases/local_product_db_usecase.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductState> {
  NewProductsCubit() : super(NewProductState());
  final _localDb = ProductSateLocalUseCase();
  
  //** */
  void getNewProducts() async {
    final _productSateLocal = await _localDb.getNewProductStateLocalDB();
    emit(state.copyWith(
          listNewProducts: _productSateLocal!.listNewProducts));
 }
  //** */
  void loadNewProducts(NewProducts productApi) async {
    _localDb.saveNewProductStateLocalDB(productApi);
    emit(state.copyWith(
        listNewProducts: productApi.listNewProducts));
  }
}
