import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:edakratiya_web/app_component.template.dart' as ng;
import 'package:hive/hive.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart' as http;

import 'main.template.dart' as self;

@GenerateInjector(
  [
    ...routerProvidersHash,
    ClassProvider(http.Client, useClass: BrowserClient)
  ], // You can use routerProviders in production
)
const InjectorFactory injector = self.injector$Injector;

Future<void> main() async {
  if (!Hive.isBoxOpen('addresses')) {
    await Hive.openBox<String>('addresses');
  }
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
