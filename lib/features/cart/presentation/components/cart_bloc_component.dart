import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/locator.dart';
import 'cart_button_state_component.dart';
import 'cart_counter_state_component.dart';
import 'cart_state_component.dart';

@Component(
    selector: 'cart_bloc_component',
    templateUrl: 'cart_bloc_component.html',
    directives: [CartStateComponent, CartCounterStateComponent, CartButtonStateComponent,  NgIf],
    pipes: [BlocPipe])
class CartBlocComponent {
  @Input()
  int type;

  CartBloc get cartBloc => locator<CartBloc>();

  bool get isFullCart => type == 0;
  bool get isButton => type == 1;
  bool get isCounter => type == 2;
}
