import 'package:angular/core.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/user/presentation/components/user_state_component.dart';

import '../../../../locator.dart';

enum UserBlocWidgetType { button, profile }

@Component(
  selector: 'user_bloc_component',
  templateUrl: 'user_bloc_component.html',
  pipes: [BlocPipe],
  directives: [UserStateComponent],
  exports: [UserBlocWidgetType],
)
class UserBlocComponent {
  @Input()
  UserBlocWidgetType type;

  UserBloc get userBloc => locator<UserBloc>();
  void signOut() {
    userBloc.add(UserSignOutEvent());
  }
}
