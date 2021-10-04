import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';
import 'order_state_component.dart';

@Component(
    selector: 'order_bloc_component',
    templateUrl: 'order_bloc_component.html',
    directives: [OrderStateComponent],
    pipes: [BlocPipe])
class OrderBlocComponent {
  OrderBloc get orderBloc => locator<OrderBloc>();
}
