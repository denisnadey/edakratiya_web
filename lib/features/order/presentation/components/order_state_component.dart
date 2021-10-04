import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/orders/presentation/bloc/order_bloc.dart';
import 'package:edakratiya_web/locator.dart';

import 'order_creation_component.dart';

@Component(
  selector: 'order_state_component',
  templateUrl: 'order_state_component.html',
  directives: [OrderCreationComponent, NgIf],
)
class OrderStateComponent {
  @Input()
  OrderState state;

  bool get isLoaded => state is LoadedOrderState || state is InitialOrderState;
  bool get isLoading => state is LoadingOrderState;
  bool get isFailure => state is FailureOrderState;
  bool get isCompleted {
    if (state is CompletedOrderState) {
      locator<OrderHistoryBloc>().add(
          AddOrderToHistoryEvent(order: (state as CompletedOrderState).order));
      return true;
    } else {
      return false;
    }
  }

  NewOrder get order => isLoaded ? state.order : null;

  Failure get failure =>
      isFailure ? (state as FailureOrderState).failure : null;
}
