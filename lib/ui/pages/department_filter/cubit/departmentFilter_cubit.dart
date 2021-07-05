import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:veggy/domain/models/product_api.dart';
import 'package:veggy/domain/usecases/products_usecase.dart';
part 'departmentFilter_state.dart';

class DepartmentFilterCubit extends Cubit<DepartmentFilterState> {

  DepartmentFilterCubit() : super(DepartmentFilterState());
  final _productUseCase = ProductUseCase();

  void addProducts() async{
    final tempList;
    tempList = await categorySwitchSearch();
    emit(state.copyWith(listProducts: state.listProducts + tempList));
  }

  Future<List<ProductApi>> categorySwitchSearch() async {

    List<ProductApi> tempList = [];
    List<String> subCodes = [];
    if (!state.lastElements.isEmpty){
      subCodes = state.lastElements.split(":");
    }

    switch(state.currentCategory) {
      //MATERIA PRIMA LICITACIONES
      //NO DEFINIDA
      case "FRUTASVERDURAS": {
        //FRUTAS
        //LEGUMBRES
        //VERDURAS
        //TUBERCULOS
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
        //CARNE DE RES
        //CARNE DE CERDO
        //CARNE DE POLLO
        //MARISCOS
        //EMBUTIDOS
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
        //GRANEL
        //PROCESADOS
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
        //ABARROTES
        //LACTEOS
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
        //PRODUCTO TERMINADO FABRICA DE PLASTICO
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

  void changeCategory(String category) async{
    emit(state.copyWith(currentCategory: category, lastElements: ""));
    addProducts();
  }
}
