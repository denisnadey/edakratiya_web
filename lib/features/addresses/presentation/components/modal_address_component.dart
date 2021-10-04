import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import '../bloc/modal_address_bloc.dart';
import 'edit/address_edit_bloc_component.dart';
import 'list/address_list_bloc_component.dart';

@Component(
    selector: 'modal_address_component',
    templateUrl: 'modal_address_component.html',
    directives: [
      MaterialButtonComponent,
      AddressListBlocComponent,
      AddressEditBlocComponent,
      NgIf,
    ])
class ModalAddressComponent implements OnDestroy {
  @Input()
  ModalAddressState state;

  void close() {
    _closeEvent.add(true);
  }

  bool get isEditOpened => state is ModalAddressEditOpened;
  bool get isListOpened => state is ModalAddressListOpened;

  final _closeEvent = StreamController<bool>();
  @Output()
  Stream<bool> get closeClicked => _closeEvent.stream;

  @override
  void ngOnDestroy() {
    _closeEvent.close();
  }
}
