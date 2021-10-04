import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';

@Component(
    selector: 'cart_dish_component', templateUrl: 'cart_dish_component.html')
class DishComponent {
  @Input()
  MapEntry<CartDish, int> dish;
  String get title => dish.key.title;
  int get price => dish.key.newPrice ?? dish.key.price;
  int get count => dish.value;
  void plus() {
    locator<CartBloc>().add(AddDishEvent(dish: dish.key, count: 1));
  }

  void minus() {
    locator<CartBloc>().add(RemoveDishEvent(dish: dish.key));
  }
  int get fullPrice => count * price;
  String get smString => '(${dish.key.size } см)';
  String get measureString =>
      '''${dish.key.measure} ${dish.key.measureUnit}    ${dish.key.size != null  ? smString : ""}  ''';
}
