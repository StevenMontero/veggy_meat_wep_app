import 'package:flutter/material.dart';
import 'package:veggy/ui/widgets/navbar.dart';
import 'package:veggy/ui/widgets/bottomBar.dart';
import 'package:veggy/util/sizingInfo.dart';
import 'package:veggy/values/responsiveApp.dart';

class LayautPage extends StatelessWidget {
  LayautPage(this.bodyWidget) : super();
  final Widget bodyWidget;
  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme;
    final responsiveApp = ResponsiveApp(context);
    return Scaffold(appBar: Navbar(), body: bodyWidget, bottomNavigationBar: isDesktop(context)? BottomBar(): null);
  }
}
