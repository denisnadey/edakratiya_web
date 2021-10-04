import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:firebase/firebase.dart' as fb;

import 'features/core/presentation/components/header_component.dart';
import 'features/user/presentation/bloc/modal_profile_bloc.dart';
import 'features/user/presentation/components/modals_bloc_component.dart';
import 'locator.dart';
import 'route_paths.dart';
import 'routes.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    HeaderComponent,
    ModalsBlocComponent,
  ],
  exports: [RoutePaths, Routes],
  providers: [
    overlayBindings,
    popupBindings,
    materialProviders,
  ],
)
class AppComponent implements OnInit, OnDestroy {
  bool visible = true;
  StreamSubscription userSubscription;
  StreamSubscription cartSubscription;
  AppComponent();
  fb.Auth auth;
  @override
  void ngOnDestroy() {
    userSubscription?.cancel();
    cartSubscription?.cancel();
  }

  @override
  void ngOnInit() {
    setupLocator();
    auth ??= fb.auth();
    cartSubscription ??= locator<CartBloc>().listen((state) {
      locator<OrderBloc>().add(ChangeOrderEvent(products: state.cart));
    });
    userSubscription ??= auth.onAuthStateChanged.listen(
      (event) {
        locator<UserBloc>().add(
          UserStreamEvent(
              extUser: (event != null)
                  ? ExternalUser(uid: event.uid, phoneNumber: event.phoneNumber)
                  : null),
        );
        locator<UserModalsBloc>().add(CloseModalsEvent());
      },
    );
  }
}
