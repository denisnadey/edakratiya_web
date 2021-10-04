import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_web/features/user/presentation/bloc/modal_profile_bloc.dart';
import 'package:edakratiya_web/features/user/presentation/components/modals_state_component.dart';

import '../../../../locator.dart';

@Component(
    selector: 'modals_bloc_component',
    templateUrl: 'modals_bloc_component.html',
    pipes: [BlocPipe],
    directives: [ModalsStateComponent])
class ModalsBlocComponent {
  UserModalsBloc get modalsBloc => locator<UserModalsBloc>();
}
