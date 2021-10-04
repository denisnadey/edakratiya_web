import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'modal_address_event.dart';
part 'modal_address_state.dart';

class ModalAddressBloc extends Bloc<ModalAddressEvent, ModalAddressState> {
  ModalAddressBloc() : super(ModalAddressListOpened());

  @override
  Stream<ModalAddressState> mapEventToState(
    ModalAddressEvent event,
  ) async* {
    if (event is OpenAddressListEvent) {
      yield ModalAddressListOpened();
    } else if (event is OpenAddressEditEvent) {
      yield ModalAddressEditOpened();
    }
  }
}
