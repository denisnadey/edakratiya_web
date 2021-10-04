import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/addresses/presentation/bloc/modal_address_bloc.dart';

import '../../../../../locator.dart';

@Component(
    selector: 'address_list_state_component',
    templateUrl: 'address_list_state_component.html',
    directives: [NgIf, NgFor])
class AddressListStateComponent implements AfterContentInit {
  @Input()
  AddressListState state;

  bool get isLoaded => state is AddressListLoaded;
  bool get isLoading => state is AddressListLoading;
  bool get isFailure => state is AddressListFailure;
  bool get isInitial => state is AddressListInitial;

  Failure get failure =>
      isFailure ? (state as AddressListFailure).failure : null;
  List<Address> get addressList =>
      isLoaded ? (state as AddressListLoaded).addresses : null;

  void addressClick(Address address) {
    locator<OrderBloc>().add(ChangeOrderEvent(address: address));
  }

  void addAddress() {
    locator<ModalAddressBloc>().add(OpenAddressEditEvent());
  }

  @override
  void ngAfterContentInit() {
    if (isInitial) locator<AddressListBloc>().add(AddressListRefresh());
    if (isLoaded && (addressList?.isEmpty ?? true)) addAddress();
  }
}
