import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/cart/presentation/components/cart_asset_component.dart';

import '../../../../locator.dart';
import '../../../../route_paths.dart';
import 'cart_dish_component.dart';

@Component(
  selector: 'cart_component',
  templateUrl: 'cart_component.html',
  directives: [coreDirectives, DishComponent, CartAssetComponent],
  pipes: [commonPipes],
)
class CartComponent {
  @Input()
  Map<CartDish, int> cart;

  final Router _router;
  CartComponent(this._router);
  int count = 0;

  bool get isEmpty => cart?.isEmpty ?? true;

  List<MapEntry<CartDish, int>> get entries => cart.entries.toList();
  int get sum => (cart.isNotEmpty)
      ? cart.entries
          .map((e) => (e.key.newPrice ?? e.key.price) * e.value)
          .reduce((value, element) => value += element)
      : 0;
  void clear() {
    locator<CartBloc>().add(ClearCartEvent());
  }

  Future<NavigationResult> goToOrder() async {
    if (isEmpty) {
      return null;
    }
    return _router.navigate(RoutePaths.order.toUrl());
  }
}
