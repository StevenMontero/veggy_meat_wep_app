import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:veggy/ui/pages/department_filter/cubit/departmentFilter_cubit.dart';
import 'package:veggy/ui/widgets/grid_product_view.dart';
import 'package:veggy/domain/usecases/products_usecase.dart';
import 'package:veggy/router/navigation_key.dart';

class DepartmentFilterPage extends StatelessWidget {

  DepartmentFilterPage({required this.currentDepartment}) : super();
  final String currentDepartment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DepartmentFilterCubit()..changeCategory(currentDepartment),
      child: MyMainContainer(
        currentDepartment : currentDepartment,
      ),
    );
  }
}

enum DrawerSelection { frutasverduras, carniceria, granel, abarrotes, licores, jardineria, accesorios, panaderia}

class MyMainContainer extends StatelessWidget {

  MyMainContainer({required this.currentDepartment}) : super();
  DrawerSelection _drawerSelection = DrawerSelection.frutasverduras;
  final String currentDepartment;
  final ProductUseCase useCase = ProductUseCase();
  ScrollController myController = new ScrollController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<DepartmentFilterCubit, DepartmentFilterState>(
    builder: (context, state) {
      myController.addListener(() {
        if (myController.position.pixels == myController.position.maxScrollExtent){
          context.read<DepartmentFilterCubit>().addProducts();
        }
      });
      return Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                      height: 180.0,
                      child: Center(
                        child: Text("Aquí va el banner."),
                      )
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 220.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Center(
                            child: Text('Departamentos'),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              SizedBox(height: 10),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.frutasverduras,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.frutasverduras) {
                                    _drawerSelection = DrawerSelection.frutasverduras;
                                    context.read<DepartmentFilterCubit>().changeCategory("FRUTASVERDURAS");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"FRUTASVERDURAS"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_frutas_y_verduras.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Frutas y Verduras'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.carniceria,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.carniceria) {
                                    _drawerSelection = DrawerSelection.carniceria;
                                    context.read<DepartmentFilterCubit>().changeCategory("CARNICERIA");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"CARNICERIA"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_carniceria.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Carniceria'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.granel,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.granel) {
                                    _drawerSelection = DrawerSelection.granel;
                                    context.read<DepartmentFilterCubit>().changeCategory("GRANEL");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"GRANEL"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_granel.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Granel'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.abarrotes,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.abarrotes) {
                                    _drawerSelection = DrawerSelection.abarrotes;
                                    context.read<DepartmentFilterCubit>().changeCategory("ABARROTES");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"ABARROTES"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_abarrotes.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Abarrotes'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.licores,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.licores) {
                                    _drawerSelection = DrawerSelection.licores;
                                    context.read<DepartmentFilterCubit>().changeCategory("LICORES");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"LICORES"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_licores.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Licores'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.jardineria,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.jardineria) {
                                    _drawerSelection = DrawerSelection.jardineria;
                                    context.read<DepartmentFilterCubit>().changeCategory("JARDINERIA");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"JARDINERIA"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_jardineria.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Jardineria'),
                              ),
                              ListTile(
                                selected: _drawerSelection == DrawerSelection.accesorios,
                                onTap: () {
                                  if (_drawerSelection != DrawerSelection.accesorios) {
                                    _drawerSelection = DrawerSelection.accesorios;
                                    context.read<DepartmentFilterCubit>().changeCategory("ACCESORIOS");
                                    NavigationService.navigateToWithArguments('departmentFilter/${"ACCESORIOS"}', null);
                                  }
                                },
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_accesorios.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Accesorios'),
                              ),
                              ListTile(
                                leading: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 36,
                                    maxHeight: 36,
                                  ),
                                  child: Image.asset(
                                    'assets/icons/icono_panaderia.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text('Panadería'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        child: GridProductWidget(listProduct: state.listProducts, controller: myController),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

/*child: Scrollbar(
                        child: GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200.0,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1),
                            itemCount: 40,
                            itemBuilder: (BuildContext ctx, index) {
                              return ProductCard(
                                  title: 'Soya Chips',
                                  price: 'CRC 3000',
                                  category: 'Abarrotes',
                                  code: '2341234',
                                  imageUrl: '',
                                  onPressCard: () {},
                                  onPressButton: () {});
                            }),
                      ),

 */