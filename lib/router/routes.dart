import 'package:fluro/fluro.dart';
import 'package:veggy/ui/pages/404page/notfound_page.dart';
import 'package:veggy/ui/pages/detail/detail_page.dart';
import 'package:veggy/ui/pages/formpage/form_preorder_page.dart';
import 'package:veggy/ui/pages/homePage.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String detailRoute = '/detail';
  static String homeRoute = '/home';
  static String formPreOrderRoute = '/preorder';

  static Handler _detailHandler =
      Handler(handlerFunc: (context, parameters) => DetailPage());
  static Handler _homeHandler =
      Handler(handlerFunc: (context, parameters) => HomePage());
  static Handler _notFoundHandler =
      Handler(handlerFunc: (context, parameters) => NoPageFoundPage());
  static Handler _formPreOrderHandler =
      Handler(handlerFunc: (context, parameters) => FormPreorderPage());
  static void setupRouter() {
    router.define(rootRoute,
        handler: _formPreOrderHandler, transitionType: TransitionType.none);
    router.define(formPreOrderRoute,
        handler: _detailHandler, transitionType: TransitionType.none);
    router.define(detailRoute,
        handler: _homeHandler, transitionType: TransitionType.fadeIn);
    router.define(formPreOrderRoute,
        handler: _formPreOrderHandler, transitionType: TransitionType.none);

    router.notFoundHandler = _notFoundHandler;
  }
}
