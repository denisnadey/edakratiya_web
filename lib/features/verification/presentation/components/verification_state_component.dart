import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import '../../../../locator.dart';

@Component(
  selector: 'verification_state_component',
  templateUrl: 'verification_state_component.html',
  directives: [
    MaterialFabComponent,
    coreDirectives,
    MaterialInputComponent,
  ],
)
class VerificationStateComponent {
  @Input()
  VerificationState state;
  bool get isInitial => state is InitialVerificationState;
  bool get isPhoneError => state is ErrorWithPhonenumberState;
  bool get isCodeError => state is ErrorWithCodeState;
  bool get isWaitingForCode => state is WaitingForCodeState;
  String get phoneError => isPhoneError
      ? ((state as ErrorWithPhonenumberState).failure as ServerFailure)
          .error
          .toString()
      : null;
  String get codeError =>
      isCodeError ? (state as ErrorWithCodeState).failure.toString() : null;
  void sendCode(String code) {
    locator<VerificationBloc>()
        .add(SendCodeEvent(code: code, verificationCallback: (str) {}));
  }

  void request(String phonenumber) {
    locator<VerificationBloc>()
        .add(RequestVerificationEvent(phonenumber: phonenumber));
  }

}
