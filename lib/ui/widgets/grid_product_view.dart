import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/product_card.dart';
import 'package:veggy/domain/models/product_api.dart';

class GridProductWidget extends StatelessWidget {
  GridProductWidget({required this.listProduct, required this.controller}) : super();
  final List<ProductApi> listProduct;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: GridView.builder(
        controller: controller,
          padding: EdgeInsets.symmetric(horizontal: 24),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),

          itemCount: listProduct.length,
          itemBuilder: (BuildContext ctx, index) {
            return ProductCard(
                title: listProduct[index].name,
                price: listProduct[index].name,
                code: listProduct[index].code,
                category: listProduct[index].itemGroup,
                imageUrl: '',
                onPressCard: () {},
                onPressButton: () {});
          }),
    );
  }
}
