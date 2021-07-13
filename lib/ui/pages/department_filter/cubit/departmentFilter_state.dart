part of 'departmentFilter_cubit.dart';

class DepartmentFilterState extends Equatable {

  final List<ProductApi> listProducts;
  String currentCategory;
  String lastElements;
  String searchString;

  DepartmentFilterState(
      {this.listProducts = const [], this.currentCategory = 'FRUTASVERDURAS', this.lastElements = '', this.searchString = ''});

  DepartmentFilterState copyWith(
      {List<ProductApi>? listProducts, String? currentCategory, String? lastElements, String? searchString}) {
    return DepartmentFilterState(
        listProducts: listProducts ?? this.listProducts,
        currentCategory: currentCategory ?? this.currentCategory,
        lastElements: lastElements ?? this.lastElements,
        searchString: searchString ?? this.searchString
    );
  }

  @override
  List<Object> get props => [listProducts, currentCategory, lastElements, searchString];
}
