import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'cart_component.dart';

@Component(
    selector: 'cart_counter_state_component',
    templateUrl: 'cart_counter_state_component.html',
    directives: [coreDirectives, CartComponent])
class CartCounterStateComponent {
  @Input()
  CartState state;
  bool get isLoaded => state is LoadedCartState;
  int get dishCounter => cart.entries.length;
  Map<CartDish, int> get cart =>
      isLoaded ? (state as LoadedCartState).cart : null;
  int get sum => (isLoaded && cart.isNotEmpty)
      ? cart.entries
          .map((e) => (e.key.newPrice ?? e.key.price) * e.value)
          .reduce((value, element) => value += element)
      : 0;
}
