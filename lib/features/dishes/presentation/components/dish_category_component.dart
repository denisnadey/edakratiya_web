import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import 'dish_card_component.dart';

@Component(
  selector: 'dish_category',
  templateUrl: 'dish_category_component.html',
  directives: [
    DishCardComponent,
    coreDirectives,
  ],
)
class DishCategoryComponent {
  @Input()
  List<DishGroup> groupes;

  @Input()
  Category category;

  List<DishGroup> get subGroupes =>
      groupes.where((e) => e.category == category).toSet().toList();
}
