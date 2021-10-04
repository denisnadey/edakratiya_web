import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';

class GlobalSettingsFirestoreDatasource extends GlobalSettingsRemoteDatasource {
  final Firestore _firestore = firestore();
  final settingsPath = '/settings/globalSettings';
  @override
  Future<GlobalSettingsModel> getSettings() async {
    try {
      final doc = await _firestore.doc(settingsPath).get();
      return GlobalSettingsModel.fromJson(doc.data());
    } catch (e) {
      rethrow;
    }
  }
}
