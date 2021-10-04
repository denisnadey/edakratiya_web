import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/verification/presentation/components/verification_state_component.dart';

import '../../../../locator.dart';

@Component(
  selector: 'verification_bloc_component',
  templateUrl: 'verification_bloc_component.html',
  pipes: [BlocPipe],
  directives: [VerificationStateComponent],
)
class VerificationBlocComponent {
  VerificationBloc get verificationBloc => locator<VerificationBloc>();
}
