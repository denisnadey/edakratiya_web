import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';

@Component(
    selector: 'required_additions_component',
    templateUrl: 'required_additions_components.html',
    directives: [
      NgFor,
    ])
class RequiredAdditionsComponent {
  @Input()
  List<String> additions;
  @Input()
  CartDish cartDish;

  void isSelected(String addition) => cartDish?.neededAdditives == addition;

  void select(String addition) {
    locator<DishConfigBloc>()
        .add(SelectedNeededAdditivesEvent(additive: addition));
  }
}
