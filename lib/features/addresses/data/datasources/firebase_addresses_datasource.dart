import 'package:edakratiya_core/features/addresses/data/datasources/addresses_remote_datasource.dart';
import 'package:edakratiya_core/features/addresses/data/models/addresses_model.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:meta/meta.dart';

class FbAddressDataSource extends AddressesRemoteDataSource {
  final Firestore _firestore = firestore();

  @override
  Future<List<AddressModel>> getAddresses({String userId, String phone}) async {
    DocumentReference docRef;
    if (userId == null) {
      final query = await _firestore
          .collection('users')
          .where('phonenumber', '==', phone)
          .limit(1)
          .get();
      if (query.empty) return [];
      docRef = query.docs.first.ref;
    } else {
      docRef = _firestore.collection('users').doc(userId);
    }
    final query = await docRef.collection('addresses').limit(10).get();
    if (query.empty) {
      return [];
    } else {
      return query.docs.map((e) => AddressModel.fromMap(e.data())).toList();
    }
  }

  @override
  Future<void> addAddress({
    @required AddressModel address,
    @required String userId,
    @required String phone,
  }) async {
    DocumentReference docRef;
    if (userId == null) {
      final query = await _firestore
          .collection('users')
          .where('phonenumber', '==', phone)
          .limit(1)
          .get();
      if (query.empty) return;
      docRef = query.docs.first.ref;
    } else {
      docRef = _firestore.collection('users').doc(userId);
    }
    await docRef.collection('addresses').add(address.toMap());
  }
}
