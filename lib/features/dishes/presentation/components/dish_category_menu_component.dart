
import 'package:angular/angular.dart';

import 'package:edakratiya_core/edakratiya_core.dart';


import 'dish_card_component.dart';

@Component(
  selector: 'dish_category_menu',
  template: '<a href="#{{category.name}}" class="item-row">{{category.name}}</a>',
  directives: [
    DishCardComponent,
    coreDirectives,
  ],
)
class DishCategoryMenuComponent {
  @Input()
  List<DishGroup> groupes;

  
  @Input()
  Category category;

  List<DishGroup> get subGroupes =>
      groupes.where((e) => e.category == category).toSet().toList();

}
