import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:veggy/ui/widgets/outline_custom_buttom.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {required this.title,
      required this.subtitle,
      required this.cornerIcon,
      required this.imageUrl,
      required this.onPressCard,
      required this.onPressButton})
      : super();
  final String title;
  final String subtitle;
  final IconData cornerIcon;
  final String imageUrl;
  final VoidCallback onPressCard;
  final VoidCallback onPressButton;
  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    return InkWell(
      radius: 8.0,
      onTap: onPressCard,
      child: Card(
        elevation: 1,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Image.network(
              'https://s2.dia.es/medias/hb7/hc3/10643207847966.jpg',
            )),
            SizedBox(
              height: 10,
            ),
            Text(title, style: themeText.headline6),
            SizedBox(
              height: 5,
            ),
            startBar,
            SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              style: themeText.subtitle2,
            ),
            SizedBox(
              height: 10,
            ),
            CustomOutlinedButton(
              onPressed: onPressButton,
              text: 'Agregar',
              color: Colors.green,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  final startBar = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.star, color: Colors.yellow[600]),
      Icon(Icons.star, color: Colors.yellow[600]),
      Icon(Icons.star, color: Colors.yellow[600]),
      Icon(Icons.star, color: Colors.yellow[600]),
      Icon(Icons.star_half, color: Colors.yellow[600]),
    ],
  );
}
