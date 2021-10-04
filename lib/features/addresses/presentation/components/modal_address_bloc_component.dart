import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_web/features/addresses/presentation/bloc/modal_address_bloc.dart';
import 'package:edakratiya_web/features/addresses/presentation/components/modal_address_component.dart';

import '../../../../locator.dart';

@Component(
  selector: 'modal_address_bloc_component',
  templateUrl: 'modal_address_bloc_component.html',
  pipes: [BlocPipe],
  directives: [ModalAddressComponent],
)
class ModalAddressBlocComponent {
  ModalAddressBloc get modalAddressBloc => locator<ModalAddressBloc>();

  final _closeEvent = StreamController<bool>();
  void closeClick({bool event}) {
    _closeEvent.add(event);
  }

  @Output()
  Stream<bool> get closeClicked => _closeEvent.stream;
}
