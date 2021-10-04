import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';
import 'package:edakratiya_web/features/verification/presentation/components/verification_bloc_component.dart';

import '../../../../locator.dart';

@Component(
    selector: 'modal_auth_component',
    templateUrl: 'modal_auth_component.html',
    directives: [
      MaterialButtonComponent,
      VerificationBlocComponent,
      MaterialButtonComponent,
      MaterialPopupComponent,
      PopupSourceDirective,
    ])
class ModalAuthComponent {
  bool visible = true;
  void close() {
    locator<UserModalsBloc>().add(CloseModalsEvent());
  }
}
