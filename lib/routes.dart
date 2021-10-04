import 'package:angular_router/angular_router.dart';
import 'package:edakratiya_web/features/dishes/presentation/routes/menu_component.template.dart'
    as menu_template;

import 'features/order/presentation/route/order_create.template.dart'
    as order_template;
import 'route_paths.dart';

export 'route_paths.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static final order = RouteDefinition(
    routePath: RoutePaths.order,
    component: order_template.OrderCreateComponentNgFactory,
  );
  static final menu = RouteDefinition(
    useAsDefault: true,
    routePath: RoutePaths.menu,
    component: menu_template.MenuComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    order,
    menu,
  ];
}
