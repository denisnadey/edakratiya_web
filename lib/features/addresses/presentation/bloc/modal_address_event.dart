part of 'modal_address_bloc.dart';

@immutable
abstract class ModalAddressEvent {}

class OpenAddressEditEvent extends ModalAddressEvent {}

class OpenAddressListEvent extends ModalAddressEvent {}
