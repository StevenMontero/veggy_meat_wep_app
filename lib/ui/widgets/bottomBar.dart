import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/email_text.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //alignment: Alignment.center,
            child: Row(
              children: [
                Container(
                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    child: Image.asset(
                      'assets/images/suscribete.png',
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 240),
                  child: EmailText(),
                ),
                Container(
                  child: TextButton(
                    onPressed: () => _launchURL('https://www.instagram.com/veggyandmeat/'),
                    child: Image.asset(
                      "assets/icons/icono_instagram.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
                Container(
                  child: TextButton(
                    onPressed: () => _launchURL('https://www.facebook.com/veggy.cr'),
                    child: Image.asset(
                      "assets/icons/icono_facebook.png",
                      height: 40,
                      width: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            margin: new EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Image.asset(
                'assets/icons/icono_principal.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}