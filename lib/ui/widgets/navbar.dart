import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veggy/ui/widgets/cart_shopping_icon.dart';
import 'package:veggy/ui/widgets/navbar_avatar.dart';
import 'package:veggy/ui/widgets/notifications_indicator.dart';
import 'package:veggy/ui/widgets/search_text.dart';
import 'package:veggy/util/sizingInfo.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          isMobileAndTablet(context)
              ? IconButton(icon: Icon(Icons.menu_outlined), onPressed: () {})
              : Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: TextButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/LOGO_VEGGY_PRINCIPAL.svg',
                        height: 40,
                        width: 40,
                      )),
                ),

          Expanded(child: Container()),

          // Search input
          if (!isMobileAndTablet(context))
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 550),
              child: SearchText(),
            ),

          Spacer(),
          Row(
            children: [
              Text(
                '¿Necesita ayuda?\n+506 8939 5313',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.phone,
                color: Colors.green,
              )
            ],
          ),
          SizedBox(width: 10),
          IconCartShoppingIndicator(),
          SizedBox(width: 24)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.black,
      boxShadow: [BoxShadow(color: Colors.white, blurRadius: 5)]);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
