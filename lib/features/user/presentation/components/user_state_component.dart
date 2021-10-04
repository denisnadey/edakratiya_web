import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/user/domain/entities/user.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';
import 'package:edakratiya_web/features/user/presentation/components/user_bloc_component.dart';
import 'package:edakratiya_web/features/user/presentation/components/user_profile_button_component.dart';

import '../../../../locator.dart';

@Component(
  selector: 'user_state_component',
  templateUrl: 'user_state_component.html',
  exports: [UserBlocWidgetType],
  directives: [
    coreDirectives,
    UserProfileButtonComponent,
  ],
)
class UserStateComponent {
  @Input()
  UserBlocWidgetType type;

  @Input()
  UserState state;
  bool get isButton => type == UserBlocWidgetType.button;
  bool get isLogined => state is LoginedUserState;
  bool get isNotLogined => state is NotLoginedUserState;
  bool get isFailure => state is FailureUserState;

  EdaUser get user => isLogined ? (state as LoginedUserState).user : null;

  void authClick() {
    locator<UserModalsBloc>().add(OpenAuthEvent());
  }
}
