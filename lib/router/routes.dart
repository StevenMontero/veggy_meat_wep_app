import 'package:fluro/fluro.dart';
import 'package:veggy/ui/pages/404page/notfound_page.dart';
import 'package:veggy/ui/pages/detail/detail_page.dart';
import 'package:veggy/ui/pages/homePage.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String pokemonsRoute = '/detail';
  static String trainersRoute = '/home';

  static Handler _detailHandler =
      Handler(handlerFunc: (context, parameters) => DetailPage());
  static Handler _homeHandler =
      Handler(handlerFunc: (context, parameters) => HomePage());
  static Handler _notFoundHandler =
      Handler(handlerFunc: (context, parameters) => NoPageFoundPage());
  static void setupRouter() {
    router.define(rootRoute,
        handler: _detailHandler, transitionType: TransitionType.none);
    router.define(pokemonsRoute,
        handler: _homeHandler, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = _notFoundHandler;
  }
}
