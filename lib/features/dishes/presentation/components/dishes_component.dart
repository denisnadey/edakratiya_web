import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/dishes/presentation/components/dishes_state_component.dart';

import '../../../../locator.dart';
import 'categorymenu_state_component.dart';

@Component(
  selector: 'dishes_component',
  templateUrl: 'dishes_component.html',
  pipes: [BlocPipe],
  directives: [ coreDirectives, MaterialFabComponent, CategoryMenuStateComponent ,DishesStateComponent],
)
class DishesPageComponent implements OnInit {
  @Input()
  int type;
  DishesBloc get dishesBloc => locator<DishesBloc>();
  CartBloc get cartBloc => locator<CartBloc>();

  
  bool get isBody => type == 0;
  bool get isMenu => type == 1;


  @override
  void ngOnInit() {
    refresh();
  }

  void refresh() {
    dishesBloc.add(GetMenuEvent());
  }
}
