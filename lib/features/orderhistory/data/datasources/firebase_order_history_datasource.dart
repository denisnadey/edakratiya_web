import 'package:edakratiya_core/features/orders/data/models/orders_model.dart';
import 'package:edakratiya_core/features/orders_info/data/datasources/order_history_remote_datasource.dart';
import 'package:edakratiya_core/features/orders_info/data/models/order_info_model.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:meta/meta.dart';

class FirebaseOrderHistoryDatasource extends OrderHistoryRemoteDatasource {
  final Firestore _firestore = firestore();
  final settingsPath = '/orderHistories';
  @override
  Future<List<OrderInfoModel>> getOrderHistory({@required String id}) async {
    try {
      final querySnap = await _firestore
          .collection('users')
          .doc(id)
          .collection('orders')
          .get();

      return querySnap.docs
          .map((e) => e.data())
          .map((e) => OrderInfoModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<OrderInfoModel>> addOrderToHistory({NewOrderModel order}) async {
    await _firestore
        .collection('users')
        .doc(order.user.fbId)
        .collection('orders')
        .add(order.toJson());
    final querySnap = await _firestore
        .collection('users')
        .doc(order.user.fbId)
        .collection('orders')
        .get();
    return querySnap.docs
        .map((e) => e.data())
        .map((e) => OrderInfoModel.fromMap(e))
        .toList();
  }
}
