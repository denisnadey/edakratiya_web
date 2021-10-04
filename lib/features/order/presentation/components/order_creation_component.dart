import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';
import '../../../../routes.dart';
import '../../../addresses/presentation/components/modal_address_bloc_component.dart';
import '../../../cart/presentation/components/cart_dish_component.dart';

@Component(
    selector: 'order_creation_component',
    templateUrl: 'order_creation_component.html',
    directives: [
      DishComponent,
      NgIf,
      NgFor,
      ModalComponent,
      ModalAddressBlocComponent,
    ])
class OrderCreationComponent implements AfterContentInit, AfterChanges {
  @Input()
  NewOrder order;
  bool isAddressesOpened = false;
  final Location _location;
  final Router _router;
  int count = 0;

  OrderCreationComponent(this._location, this._router);
  String get address => order.address?.toString() ?? 'Введите адрес';
  List<MapEntry<CartDish, int>> get entries =>
      order.products?.entries?.toList();

  bool get isEmpty => entries?.isEmpty ?? true;
  int get sum => (order.products?.isNotEmpty ?? false)
      ? order.products.entries
          .map((e) => (e.key.newPrice ?? e.key.price) * e.value)
          .reduce((value, element) => value += element)
      : 0;
  void clear() {
    locator<CartBloc>().add(ClearCartEvent());
    _location.back();
  }

  void closeClicked() {
    isAddressesOpened = false;
  }

  void addressClick() {
    isAddressesOpened = true;
  }

  @override
  void ngAfterContentInit() {
    locator<AddressListBloc>().add(AddressListRefresh());
    if (isEmpty) _location.back();
  }

  @override
  void ngAfterChanges() {
    if (isEmpty) _location.back();
  }

  void goBack() {
    _router.navigate(RoutePaths.menu.toUrl());
  }
}
