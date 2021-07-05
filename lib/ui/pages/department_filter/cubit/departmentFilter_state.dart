part of 'departmentFilter_cubit.dart';

class DepartmentFilterState extends Equatable {

  final List<ProductApi> listProducts;
  String currentCategory;
  String lastElements;

  DepartmentFilterState(
      {this.listProducts = const [], this.currentCategory = 'FRUTASVERDURAS', this.lastElements = ''});

  DepartmentFilterState copyWith(
      {List<ProductApi>? listProducts,
      String? currentCategory, String? lastElements}) {
    return DepartmentFilterState(
        listProducts: listProducts ?? this.listProducts,
        currentCategory: currentCategory ?? this.currentCategory,
        lastElements: lastElements ?? this.lastElements
    );
  }

  @override
  List<Object> get props => [listProducts, currentCategory, lastElements];
}
