import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/domain/usecases/products_usecase.dart';
part 'departmentFilter_state.dart';

/**
 * Clase de tipo Cubit para manejo de estado de la seccion de vista
 * por departamentos. Posee un ProductUseCase para solicitar información
 * de la base de datos.
 */
class DepartmentFilterCubit extends Cubit<DepartmentFilterState> {

  DepartmentFilterCubit() : super(DepartmentFilterState());
  final _productUseCase = ProductUseCase();

  /**
   * Función para agregar productos a la lista del estado. Solicita
   * la lista a la función categorySwitchSearch() y actualiza el
   * estado con esta lista.
   */
  void addProducts() async{
    final tempList;
    tempList = await categorySwitchSearch();
    emit(state.copyWith(listProducts: state.listProducts + tempList));
  }

  /**
   * Función encargada de devolver la lista de productos de la
   * categoría actualmente seleccionada en el estado. Si el estado
   * tiene un valor para el último elemento, agrega a la lista actual del
   * estado más productos apartir de este último elemento.
   * @Return : Future<List<ProductApi>>
   * Lista de productos obtenida.
   */
  Future<List<ProductApi>> categorySwitchSearch() async {

    List<ProductApi> tempList = [];
    List<String> subCodes = [];
    if (state.lastElements.isNotEmpty){
      subCodes = state.lastElements.split(":");
    }
    switch(state.currentCategory) {
      case "FRUTASVERDURAS": {
        List<ProductApi> listFrutas = [];
        List<ProductApi> listVerduras = [];
        List<ProductApi> listTuberculos = [];
        List<ProductApi> listLegumbres = [];
        if (!state.lastElements.isEmpty){
          listFrutas = await _productUseCase.getProductsByCateforie('FRUTAS', subCodes[0]);
          listVerduras = await _productUseCase.getProductsByCateforie('VERDURAS', subCodes[1]);
          listTuberculos = await _productUseCase.getProductsByCateforie('TUBERCULOS', subCodes[2]);
          listLegumbres = await _productUseCase.getProductsByCateforie('LEGUMBRES', subCodes[3]);
        } else {
          listFrutas = await _productUseCase.getProductsByCateforie('FRUTAS', null);
          listVerduras = await _productUseCase.getProductsByCateforie("VERDURAS", null);
          listTuberculos = await _productUseCase.getProductsByCateforie("TUBERCULOS", null);
          listLegumbres = await _productUseCase.getProductsByCateforie("LEGUMBRES", null);
        }

        int n = 0;

        while (n<listFrutas.length || n<listVerduras.length || n<listTuberculos.length || n<listLegumbres.length) {
          if(n<listFrutas.length){
            tempList.add(listFrutas[n]);
          }
          if(n<listVerduras.length){
            tempList.add(listVerduras[n]);
          }
          if(n<listTuberculos.length){
            tempList.add(listTuberculos[n]);
          }
          if(n<listLegumbres.length){
            tempList.add(listLegumbres[n]);
          }
          n++;
        }
        String newLast = listFrutas.last.code + ":";
        newLast += listVerduras.last.code + ":";
        newLast += listTuberculos.last.code + ":";
        newLast += listLegumbres.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "CARNICERIA": {
        List<ProductApi> listCarneRes = [];
        List<ProductApi> listCarneCerdo = [];
        List<ProductApi> listCarnePollo = [];
        List<ProductApi> listMariscos = [];
        List<ProductApi> listEmbutidos = [];
        if (!state.lastElements.isEmpty){
          listCarneRes = await _productUseCase.getProductsByCateforie('CARNE DE RES', subCodes[0]);
          listCarneCerdo = await _productUseCase.getProductsByCateforie('CARNE DE CERDO', subCodes[1]);
          listCarnePollo = await _productUseCase.getProductsByCateforie('CARNE DE POLLO', subCodes[2]);
          listMariscos = await _productUseCase.getProductsByCateforie('MARISCOS', subCodes[3]);
          listEmbutidos = await _productUseCase.getProductsByCateforie('EMBUTIDOS', subCodes[4]);
        } else {
          listCarneRes = await _productUseCase.getProductsByCateforie('CARNE DE RES', null);
          listCarneCerdo = await _productUseCase.getProductsByCateforie('CARNE DE CERDO', null);
          listCarnePollo = await _productUseCase.getProductsByCateforie('CARNE DE POLLO', null);
          listMariscos = await _productUseCase.getProductsByCateforie('MARISCOS', null);
          listEmbutidos = await _productUseCase.getProductsByCateforie('EMBUTIDOS', null);
        }

        int n = 0;

        while (n<listCarneRes.length || n<listCarneCerdo.length || n<listCarnePollo.length || n<listMariscos.length || n<listEmbutidos.length) {
          if(n<listCarneRes.length){
            tempList.add(listCarneRes[n]);
          }
          if(n<listCarneCerdo.length){
            tempList.add(listCarneCerdo[n]);
          }
          if(n<listCarnePollo.length){
            tempList.add(listCarnePollo[n]);
          }
          if(n<listMariscos.length){
            tempList.add(listMariscos[n]);
          }
          if(n<listEmbutidos.length){
            tempList.add(listEmbutidos[n]);
          }
          n++;
        }
        String newLast = listCarneRes.last.code + ":";
        newLast += listCarneCerdo.last.code + ":";
        newLast += listCarnePollo.last.code + ":";
        newLast += listMariscos.last.code + ":";
        newLast += listEmbutidos.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "GRANEL": {
        List<ProductApi> listGranel = [];
        List<ProductApi> listProcesados = [];
        if (!state.lastElements.isEmpty){
          listGranel = await _productUseCase.getProductsByCateforie('GRANEL', subCodes[0]);
          listProcesados = await _productUseCase.getProductsByCateforie('PROCESADOS', subCodes[1]);
        } else {
          listGranel = await _productUseCase.getProductsByCateforie('GRANEL', null);
          listProcesados = await _productUseCase.getProductsByCateforie('PROCESADOS', null);
        }

        int n = 0;

        while (n<listGranel.length || n<listProcesados.length) {
          if(n<listGranel.length){
            tempList.add(listGranel[n]);
          }
          if(n<listProcesados.length){
            tempList.add(listProcesados[n]);
          }
          n++;
        }
        String newLast = listGranel.last.code + ":";
        newLast += listProcesados.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "ABARROTES": {
        List<ProductApi> listAbarrotes = [];
        List<ProductApi> listLacteos = [];
        if (!state.lastElements.isEmpty){
          listAbarrotes = await _productUseCase.getProductsByCateforie('ABARROTES', subCodes[0]);
          listLacteos = await _productUseCase.getProductsByCateforie('LACTEOS', subCodes[1]);
        } else {
          listAbarrotes = await _productUseCase.getProductsByCateforie('ABARROTES', null);
          listLacteos = await _productUseCase.getProductsByCateforie('LACTEOS', null);
        }

        int n = 0;

        while (n<listAbarrotes.length || n<listLacteos.length) {
          if(n<listAbarrotes.length){
            tempList.add(listAbarrotes[n]);
          }
          if(n<listLacteos.length){
            tempList.add(listLacteos[n]);
          }
          n++;
        }
        String newLast = listAbarrotes.last.code + ":";
        newLast += listLacteos.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "LICORES": {
        //LICORES
        List<ProductApi> listLicores = [];
        if (!state.lastElements.isEmpty){
          listLicores = await _productUseCase.getProductsByCateforie('LICORES', subCodes[0]);
          listLicores.addAll(await _productUseCase.getProductsByCateforie('LICORES', listLicores.last.code));
        } else {
          listLicores = await _productUseCase.getProductsByCateforie('LICORES', null);
          listLicores.addAll(await _productUseCase.getProductsByCateforie('LICORES', listLicores.last.code));
        }

        int n = 0;

        while (n<listLicores.length) {
          if(n<listLicores.length){
            tempList.add(listLicores[n]);
          }
          n++;
        }
        String newLast = listLicores.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "JARDINERIA": {
        //FLORISTERIA
        List<ProductApi> listFloristeria = [];
        if (!state.lastElements.isEmpty){
          listFloristeria = await _productUseCase.getProductsByCateforie('FLORISTERIA', subCodes[0]);
          listFloristeria.addAll(await _productUseCase.getProductsByCateforie('FLORISTERIA', listFloristeria.last.code));
        } else {
          listFloristeria = await _productUseCase.getProductsByCateforie('FLORISTERIA', null);
          listFloristeria.addAll(await _productUseCase.getProductsByCateforie('FLORISTERIA', listFloristeria.last.code));
        }

        int n = 0;

        while (n<listFloristeria.length) {
          if(n<listFloristeria.length){
            tempList.add(listFloristeria[n]);
          }
          n++;
        }
        String newLast = listFloristeria.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "ACCESORIOS": {
        List<ProductApi> listAccesorios = [];
        if (!state.lastElements.isEmpty){
          listAccesorios = await _productUseCase.getProductsByCateforie('PRODUCTO TERMINADO FABRICA DE PLASTICO', subCodes[0]);
          listAccesorios.addAll(await _productUseCase.getProductsByCateforie('PRODUCTO TERMINADO FABRICA DE PLASTICO', listAccesorios.last.code));
        } else {
          listAccesorios = await _productUseCase.getProductsByCateforie('PRODUCTO TERMINADO FABRICA DE PLASTICO', null);
          listAccesorios.addAll(await _productUseCase.getProductsByCateforie('PRODUCTO TERMINADO FABRICA DE PLASTICO', listAccesorios.last.code));
        }

        int n = 0;

        while (n<listAccesorios.length) {
          if(n<listAccesorios.length){
            tempList.add(listAccesorios[n]);
          }
          n++;
        }
        String newLast = listAccesorios.last.code + ":";
        state.lastElements = newLast;
      }
      break;
      case "PANADERIA": {

      }
      break;
    }
    return tempList;
  }

  /**
   * Función para buscar productos que coincidan con el valor de búsqueda
   * solicitado por el usuario. Se agregan estos elementos a la lista del
   * estado.
   */
  void addResults() async {
    List<ProductApi> tempList = [];
    switch(state.currentCategory) {
      case "FRUTASVERDURAS": {
        List<ProductApi> listFrutas = await _productUseCase.searchProductsByCategory('FRUTAS', state.searchString);
        List<ProductApi> listVerduras = await _productUseCase.searchProductsByCategory('VERDURAS', state.searchString);
        List<ProductApi> listTuberculos = await _productUseCase.searchProductsByCategory('TUBERCULOS', state.searchString);
        List<ProductApi> listLegumbres = await _productUseCase.searchProductsByCategory('LEGUMBRES', state.searchString);

        int n = 0;

        while (n<listFrutas.length || n<listVerduras.length || n<listTuberculos.length || n<listLegumbres.length) {
          if(n<listFrutas.length){
            tempList.add(listFrutas[n]);
          }
          if(n<listVerduras.length){
            tempList.add(listVerduras[n]);
          }
          if(n<listTuberculos.length){
            tempList.add(listTuberculos[n]);
          }
          if(n<listLegumbres.length){
            tempList.add(listLegumbres[n]);
          }
          n++;
        }
      }
      break;
      case "CARNICERIA": {
        List<ProductApi> listCarneRes = await _productUseCase.searchProductsByCategory('CARNE DE RES', state.searchString);
        List<ProductApi> listCarneCerdo = await _productUseCase.searchProductsByCategory('CARNE DE CERDO', state.searchString);
        List<ProductApi> listCarnePollo = await _productUseCase.searchProductsByCategory('CARNE DE POLLO', state.searchString);
        List<ProductApi> listMariscos = await _productUseCase.searchProductsByCategory('MARISCOS', state.searchString);
        List<ProductApi> listEmbutidos = await _productUseCase.searchProductsByCategory('EMBUTIDOS', state.searchString);

        int n = 0;

        while (n<listCarneRes.length || n<listCarneCerdo.length || n<listCarnePollo.length || n<listMariscos.length || n<listEmbutidos.length) {
          if(n<listCarneRes.length){
            tempList.add(listCarneRes[n]);
          }
          if(n<listCarneCerdo.length){
            tempList.add(listCarneCerdo[n]);
          }
          if(n<listCarnePollo.length){
            tempList.add(listCarnePollo[n]);
          }
          if(n<listMariscos.length){
            tempList.add(listMariscos[n]);
          }
          if(n<listEmbutidos.length){
            tempList.add(listEmbutidos[n]);
          }
          n++;
        }
      }
      break;
      case "GRANEL": {
        List<ProductApi> listGranel = await _productUseCase.searchProductsByCategory('GRANEL', state.searchString);
        List<ProductApi> listProcesados = await _productUseCase.searchProductsByCategory('PROCESADOS', state.searchString);

        int n = 0;

        while (n<listGranel.length || n<listProcesados.length) {
          if(n<listGranel.length){
            tempList.add(listGranel[n]);
          }
          if(n<listProcesados.length){
            tempList.add(listProcesados[n]);
          }
          n++;
        }
      }
      break;
      case "ABARROTES": {
        List<ProductApi> listAbarrotes = await _productUseCase.searchProductsByCategory('ABARROTES', state.searchString);
        List<ProductApi> listLacteos = await _productUseCase.searchProductsByCategory('LACTEOS', state.searchString);

        int n = 0;

        while (n<listAbarrotes.length || n<listLacteos.length) {
          if(n<listAbarrotes.length){
            tempList.add(listAbarrotes[n]);
          }
          if(n<listLacteos.length){
            tempList.add(listLacteos[n]);
          }
          n++;
        }
      }
      break;
      case "LICORES": {
        List<ProductApi> listLicores = await _productUseCase.searchProductsByCategory('LICORES', state.searchString);

        int n = 0;

        while (n<listLicores.length) {
          tempList.add(listLicores[n]);
          n++;
        }

      }
      break;
      case "JARDINERIA": {
        List<ProductApi> listFloristeria = await _productUseCase.searchProductsByCategory('FLORISTERIA', state.searchString);

        int n = 0;

        while (n<listFloristeria.length) {
          tempList.add(listFloristeria[n]);
          n++;
        }

      }
      break;
      case "ACCESORIOS": {
        List<ProductApi> listAccesorios = await _productUseCase.searchProductsByCategory('PRODUCTO TERMINADO FABRICA DE PLASTICO', state.searchString);

        int n = 0;

        while (n<listAccesorios.length) {
          tempList.add(listAccesorios[n]);
          n++;
        }
      }
      break;
      case "PANADERIA": {

      }
      break;
    }
    emit(state.copyWith(listProducts: tempList));
  }

  /**
   * Función para cargar una nueva lista de productos al cambiar de
   * departamento.
   * @Params : String cateogry
   * Nuevo departamento del cual se deben cargar productos.
   */
  void changeCategory(String category) async{
    emit(state.copyWith(currentCategory: category, lastElements: ""));
    addProducts();
  }

  /**
   * Función encargada de cargar una nueva lista de productos al
   * buscar productos por nombre.
   * @Params : String category
   * Departamento en el cual se va a buscar el producto.
   * @Params: String searchTerm
   * Término que desea buscar el usuario.
   */
  void searchTerm(String category, String searchTerm) async{
    emit(state.copyWith(currentCategory: category, lastElements: "", searchString: searchTerm));
    addResults();
  }
}
