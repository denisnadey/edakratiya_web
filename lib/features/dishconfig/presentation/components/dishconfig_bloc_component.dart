import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/dishconfig/presentation/components/dishconfig_state_component.dart';

import '../../../../locator.dart';

@Component(
    selector: 'dishconfig_bloc_component',
    templateUrl: 'dishconfig_bloc_component.html',
    pipes: [BlocPipe],
    directives: [DishConfigStateComponent])
class DishConfigBlocComponent {
  DishConfigBloc get dishConfigBloc => locator<DishConfigBloc>();
}
