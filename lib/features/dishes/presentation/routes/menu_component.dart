import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../../../cart/presentation/components/cart_bloc_component.dart';
import '../../../core/presentation/components/header_component.dart';
import '../../../dishconfig/presentation/components/dishconfig_bloc_component.dart';
import '../../../slider/presentation/components/slider_component.dart';
import '../../../user/presentation/components/modals_bloc_component.dart';
import '../components/dishes_component.dart';

@Component(
  selector: 'menu_component',
  templateUrl: 'menu_component.html',
  directives: [
    routerDirectives,
    HeaderComponent,
    SliderComponent,
    DishesPageComponent,
    CartBlocComponent,
    DishConfigBlocComponent,
    ModalsBlocComponent
  ],
)
class MenuComponent {}
