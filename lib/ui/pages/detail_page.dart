import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/product_card.dart';

class DetailPage extends StatelessWidget {
  const DetailPage() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: true,
        child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.6,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1),
            itemCount: 50,
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
    );
  }
}
