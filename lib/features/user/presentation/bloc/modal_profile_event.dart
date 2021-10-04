part of 'modal_profile_bloc.dart';

@immutable
abstract class UserModalsEvent {}

class OpenProfileEvent extends UserModalsEvent {}

class OpenAuthEvent extends UserModalsEvent {}

class CloseModalsEvent extends UserModalsEvent {}
