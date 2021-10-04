part of 'modal_profile_bloc.dart';

@immutable
abstract class UserModalsState {}

class UserModalsClosed extends UserModalsState {}

class ModalProfileOpened extends UserModalsState {}

class ModalAuthOpened extends UserModalsState {}
