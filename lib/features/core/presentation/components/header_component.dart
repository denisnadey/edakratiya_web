import 'package:angular/angular.dart';
import 'package:edakratiya_web/features/cart/presentation/components/cart_bloc_component.dart';
import 'package:edakratiya_web/features/core/presentation/components/info_bloc_component.dart';
import 'package:edakratiya_web/features/user/presentation/components/user_bloc_component.dart';

@Component(
  selector: 'header_component',
  templateUrl: 'header_component.html',
  directives: [
    coreDirectives,
    InfoBlocComponent,
    CartBlocComponent,
    UserBlocComponent,
  ],
  exports: [
    UserBlocWidgetType,
  ],
)
class HeaderComponent {}
