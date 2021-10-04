import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/dishes/presentation/components/dish_category_menu_component.dart';

import 'dish_category_component.dart';

@Component(
  selector: 'dishes_state_component',
  templateUrl: 'dishes_state_component.html',
  directives: [
    MaterialSpinnerComponent,
    MaterialIconComponent,
    coreDirectives,
    DishCategoryComponent,
    DishCategoryMenuComponent
  ],
)
class DishesStateComponent {
  @Input()
  DishesState state;

  bool get isEmpty => state is InitialDishesState;
  bool get isLoading => state is LoadingDishesState;
  bool get isSuccess => state is LoadedDishesState;
  bool get isError => state is ErrorDishesState;

  List<DishGroup> get groupes =>
      isSuccess ? (state as LoadedDishesState).groupes : [];
  List<Category> get categories => isSuccess
      ? (state as LoadedDishesState)
          .groupes
          .map((e) => e.category)
          .toSet()
          .toList()
      : [];
  String get error =>
      isError ? (state as ErrorDishesState).failure.toString() : '';
}
