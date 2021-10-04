import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/user/domain/entities/user.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';

import '../../../../locator.dart';

@Component(
    selector: 'profile_info_component',
    templateUrl: 'profile_info_component.html',
    directives: [
      coreDirectives
    ])
class ProfileInfoComponent {
  @Input()
  UserState state;

  bool get isLogined => state is LoginedUserState;
  EdaUser get user {
    if (isLogined) {
      return (state as LoginedUserState).user;
    } else {
      locator<UserModalsBloc>().add(CloseModalsEvent());
      return null;
    }
  }

  void signOut() {
    locator<UserBloc>().add(UserSignOutEvent());
  }
}
