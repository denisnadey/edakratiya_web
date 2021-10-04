import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/laminate/components/modal/modal.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import 'modal_dish_component.dart';

@Component(
    selector: 'dishconfig_state_component',
    templateUrl: 'dishconfig_state_component.html',
    directives: [ModalDishComponent, ModalComponent, NgFor, NgIf])
class DishConfigStateComponent {
  @Input()
  DishConfigState state;

  bool get isReady => state is DishConfigReady;

  DishGroup get group => isReady ? (state as DishConfigReady).group : null;
  CartDish get cartDish => isReady ? (state as DishConfigReady).cartDish : null;
}
