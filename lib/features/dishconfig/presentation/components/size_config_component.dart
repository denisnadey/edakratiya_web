import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';

@Component(
    selector: 'size_config_component',
    templateUrl: 'size_config_component.html',
    directives: [NgFor, MaterialRadioComponent, MaterialRadioGroupComponent])
class SizeConfigComponent {
  @Input()
  List<int> sizes;

  @Input()
  CartDish cartDish;
  void select(int size) =>
      locator<DishConfigBloc>().add(SelectedDishSizeEvent(size: size));

  bool isSelected(int size) => size == cartDish.size;
}
