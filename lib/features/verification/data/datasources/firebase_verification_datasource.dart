import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:meta/meta.dart';
import 'package:pedantic/pedantic.dart';

class FirebaseVerificationDataSource implements VerificationRemoteDataSource {
  fb.Auth auth;
  fb.ConfirmationResult result;
  fb.RecaptchaVerifier verifier;
  @override
  Future<void> requestVerification(
      {@required String phonenumber,
      void Function(String) verificationCallback,
      @required VerificationBloc bloc}) async {
    try {
      auth ??= fb.auth();
      verifier = fb.RecaptchaVerifier('recaptcha-container');
      unawaited(verifier.render());
      result = await auth.signInWithPhoneNumber(
        phonenumber,
        verifier,
      );
      verifier.clear();
      bloc.add(CodeSentEvent(verificationId: result.verificationId));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> sendCode(
      {@required String code,
      @required String verificationId,
      void Function(String) verificationCallback,
      @required VerificationBloc bloc}) async {
    try {
      final codeClean = code.replaceAll(RegExp(r'\D'), '');
      if (result != null && result.verificationId == verificationId) {
        final res = await result.confirm(codeClean);
        bloc.add(VerificationCompletedEvent(
            phonenumber: res.user.phoneNumber, callback: verificationCallback));
      }
    } catch (e) {
      rethrow;
    }
  }
}
