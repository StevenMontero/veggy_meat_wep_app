import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:veggy/ui/widgets/outline_custom_buttom.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {required this.title,
      required this.price,
      required this.code,
      required this.category,
      required this.imageUrl,
      required this.onPressCard,
      required this.onPressButton})
      : super();
  final String title;
  final String price;
  final String code;
  final String category;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Image.network(
                "http://186.177.135.3:45570/api/Articulos/Imagen?code=$code",
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("assets/images/imagen_no_disponible.png"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 150,
              child: Text(
                title,
                style: themeText.bodyText1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text('Codigo:$code', style: themeText.overline),
            SizedBox(
              height: 5,
            ),
            Text('Categoria:$category', style: themeText.overline),
            SizedBox(
              height: 5,
            ),
            Text(
              'CRC $price',
              style: themeText.subtitle1,
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
}
