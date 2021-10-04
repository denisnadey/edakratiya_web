import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../components/order_bloc_component.dart';

@Component(
  selector: 'order_create',
  templateUrl: 'order_create.html',
  directives: [OrderBlocComponent],
)
class OrderCreateComponent {
  final Location _location;

  OrderCreateComponent(this._location);
  void goBack() {
    _location.back();
  }
}
