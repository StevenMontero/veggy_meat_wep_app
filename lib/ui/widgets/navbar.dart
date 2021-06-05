import 'package:flutter/material.dart';
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
                    onPressed: (){},
                    child: Text(
                      'Veggy',
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),

          Expanded(child: Container()),

          // Search input
          if (!isMobileAndTablet(context))
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 550),
              child: SearchText(),
            ),

          Spacer(),
          NotificationsIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10)
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
