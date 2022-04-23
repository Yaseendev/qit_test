import 'package:fluro/fluro.dart';
import 'package:get_it/get_it.dart';

import 'routes.dart';

final locator = GetIt.instance;

void locatorsSetup() {
  locator.registerLazySingleton<FluroRouter>(() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return router;
  });
}
