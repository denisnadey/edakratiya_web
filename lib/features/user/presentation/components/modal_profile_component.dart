import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';
import 'package:edakratiya_web/features/user/presentation/components/profile_info_component.dart';

import '../../../../locator.dart';

@Component(
    selector: 'modal_profile_component',
    pipes: [BlocPipe],
    templateUrl: 'modal_profile_component.html',
    directives: [MaterialButtonComponent, ProfileInfoComponent])
class ModalProfileComponent {
  void close() {
    locator<UserModalsBloc>().add(CloseModalsEvent());
  }

  UserBloc get userBloc => locator<UserBloc>();
}
