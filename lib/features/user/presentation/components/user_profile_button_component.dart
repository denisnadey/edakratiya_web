import 'package:angular/angular.dart';
import 'package:edakratiya_core/features/user/domain/entities/user.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';

import '../../../../locator.dart';

@Component(
    selector: 'user_profile_button_component',
    templateUrl: 'user_profile_button_component.html')
class UserProfileButtonComponent {
  @Input()
  EdaUser user;

  String get name => user.name;

  void openProfile() {
    locator<UserModalsBloc>().add(OpenProfileEvent());
  }

  String get phonenumber => user.phonenumber;
}
