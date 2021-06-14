import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/product_card.dart';

class DepartmentFilterPage extends StatelessWidget {
  const DepartmentFilterPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 2000,
        child: Expanded(
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
                                  leading: Icon(Icons.whatshot),
                                  title: Text('Carniceria'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.apps),
                                  title: Text('Granel'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.air),
                                  title: Text('Frutas y Verduras'),
                                ),
                                ListTile(
                                  leading: Icon(Icons.fastfood),
                                  title: Text('Abarrotes'),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  child: Center(
                                    child: Text('Filtro'),
                                  ),
                                ),
                                const PriceFilterWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Scrollbar(
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
                                    subtitle: 'CRC 3000',
                                    cornerIcon: Icons.shop,
                                    imageUrl: '',
                                    onPressCard: () {},
                                    onPressButton: () {});
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PriceFilterWidget extends StatefulWidget {
  const PriceFilterWidget({Key? key}) : super(key: key);

  @override
  State<PriceFilterWidget> createState() => _PriceFilterWidget();
}

/// This is the private State class that goes with MyStatefulWidget.
class _PriceFilterWidget extends State<PriceFilterWidget> {
  double _currentSliderValue = 10000;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      min: 0,
      max: 20000,
      divisions: 8,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}