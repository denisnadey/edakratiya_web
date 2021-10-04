import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:meta/meta.dart';

class FirebaseUserDataSource extends UserRemoteDataSource {
  final fb.Auth auth;

  final Firestore _firestore = firestore();
  FirebaseUserDataSource({fb.Auth auth}) : auth = auth ?? fb.auth();

  @override
  Future<EdaUserModel> getUserInfo({@required ExternalUser extUser}) async {
    try {
      final fbSnapshot =
          await _firestore.collection('users').doc(extUser.uid).get();
      final fbData = fbSnapshot.data();
      return EdaUserModel.fromFirebase(
        fbId: extUser.uid,
        phonenumber: extUser.phoneNumber,
        fbData: fbData,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOutUser() {
    return auth.signOut();
  }

  @override
  Future<EdaUserModel> userInfoChange({@required EdaUserModel user}) async {
    try {
      final doc = await _firestore.collection('users').doc(user.fbId).get();
      if (doc.exists) {
        await _firestore
            .collection('users')
            .doc(user.fbId)
            .update(data: user.toJson());
      } else {
        await _firestore.collection('users').doc(user.fbId).set(user.toJson());
      }
      final fbSnap = await _firestore.collection('users').doc(user.fbId).get();

      return EdaUserModel.fromFirebase(
        fbId: user.fbId,
        phonenumber: user.phonenumber,
        fbData: fbSnap.data(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
