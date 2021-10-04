import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'cart_component.dart';

@Component(
    selector: 'cart_state_component',
    templateUrl: 'cart_state_component.html',
    directives: [coreDirectives, CartComponent])
class CartStateComponent {
  @Input()
  CartState state;
  bool get isLoading => state is LoadingCartState;
  bool get isLoaded => state is LoadedCartState;

  Map<CartDish, int> get cart =>
      isLoaded ? (state as LoadedCartState).cart : null;
}
