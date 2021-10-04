import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';
import 'package:edakratiya_web/features/user/presentation/components/modal_auth_component.dart';
import 'package:edakratiya_web/features/user/presentation/components/modal_profile_component.dart';

@Component(
  selector: 'modals_state_component',
  templateUrl: 'modals_state_component.html',
  directives: [ModalComponent, ModalProfileComponent, ModalAuthComponent],
)
class ModalsStateComponent {
  @Input()
  UserModalsState state;

  bool get isProfileOpened => state is ModalProfileOpened;
  bool get isAuthOpened => state is ModalAuthOpened;
}
