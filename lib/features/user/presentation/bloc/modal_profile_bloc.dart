import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'modal_profile_event.dart';
part 'modal_profile_state.dart';

class UserModalsBloc extends Bloc<UserModalsEvent, UserModalsState> {
  UserModalsBloc() : super(UserModalsClosed());

  @override
  Stream<UserModalsState> mapEventToState(
    UserModalsEvent event,
  ) async* {
    if (event is OpenProfileEvent) {
      yield ModalProfileOpened();
    } else if (event is CloseModalsEvent) {
      yield UserModalsClosed();
    } else if (event is OpenAuthEvent){
      yield ModalAuthOpened();
    }
  }
}
