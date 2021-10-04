import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/addresses/domain/repositories/addresses_repository.dart';
import 'package:edakratiya_core/features/cookies/cookies_controller.dart';
import 'package:edakratiya_core/features/global_settings/domain/repositories/global_settings_repository.dart';
import 'package:edakratiya_core/features/orders/domain/repositories/orders_repository.dart';
import 'package:edakratiya_core/features/orders_info/domain/repositories/order_history_repository.dart';
import 'package:edakratiya_core/features/orders_info/domain/usecases/add_order_to_history.dart';
import 'package:edakratiya_core/features/user/domain/repositories/user_repository.dart';
import 'package:edakratiya_core/features/verification/domain/repositories/verification_repository.dart';
import 'package:get_it/get_it.dart';

import 'features/addresses/data/datasources/firebase_addresses_datasource.dart';
import 'features/addresses/presentation/bloc/modal_address_bloc.dart';
import 'features/global_settings/data/datasources/global_settings_firestore_datasource.dart';
import 'features/orderhistory/data/datasources/firebase_order_history_datasource.dart';
import 'features/user/data/datasources/firebase_user_datasource.dart';
import 'features/user/presentation/bloc/modal_profile_bloc.dart';
import 'features/verification/data/datasources/firebase_verification_datasource.dart';

GetIt locator = GetIt.instance;
bool isSbis = true;
void setupLocator() {
  if (isSbis) {
    locator.registerLazySingleton<ApiTokensController>(
        () => SbisTokensController());
  }
  locator.registerLazySingleton(() => ModalAddressBloc());
  locator.registerLazySingleton(() => UserModalsBloc());
  //ORDER HISTORY
  locator.registerLazySingleton(() => OrderHistoryBloc(
        getOrderHistory: locator(),
        addOrderToHistory: locator(),
      ));
  locator.registerLazySingleton(() => GetOrderHistory(repository: locator()));
  locator.registerLazySingleton<AddOrderToHistory>(
      () => AddOrderToHistory(repository: locator()));
  locator.registerLazySingleton<OrderHistoryRepository>(
      () => OrderHistoryRepositoryImpl(remoteDatasource: locator()));
  locator.registerLazySingleton<OrderHistoryRemoteDatasource>(
      () => FirebaseOrderHistoryDatasource());
  locator.registerLazySingleton(() => GlobalSettingsBloc(
        checkGlobalSettings: locator(),
        checkLocalSettings: locator(),
      )..add(GlobalSettingsCheckEvent()));

  locator.registerLazySingleton(() => CheckGlobalSettings(
        repository: locator(),
      ));
  locator
      .registerLazySingleton(() => CheckLocalSettings(repository: locator()));
  locator.registerLazySingleton<GlobalSettingsRepository>(
      () => GlobalSettingsRepositoryImpl(
            localDatasource: locator(),
            remoteDatasource: locator(),
          ));
  locator.registerLazySingleton<GlobalSettingsLocalDatasource>(
      () => GlobalSettingsLocalDatasourceImpl());
  locator.registerLazySingleton<GlobalSettingsRemoteDatasource>(
      () => GlobalSettingsFirestoreDatasource());
  //ADDRES LIST BLOC
  locator.registerLazySingleton(() => AddressListBloc(
        addAddress: locator(),
        getAddresses: locator(),
      ));
  locator.registerLazySingleton(() => AddAddress(repository: locator()));
  locator.registerLazySingleton(() => GetAddresses(repository: locator()));
  locator.registerLazySingleton<AddressesRepository>(() =>
      AddressesRepositoryImpl(
          localDataSource: locator(), remoteDataSource: locator()));
  locator.registerLazySingleton<AddressesLocalDataSource>(
      () => HiveAddressesDataSource());
  locator.registerLazySingleton<AddressesRemoteDataSource>(
      () => FbAddressDataSource());
  locator.registerLazySingleton(() => AddressBloc());

  locator.registerLazySingleton(() => VerificationBloc(
        requestVerification: locator(),
        sendCode: locator(),
      ));
  locator.registerLazySingleton(() => RequestVerification(
        repository: locator(),
      ));
  locator.registerLazySingleton(() => SendCode(
        repository: locator(),
      ));
  locator.registerLazySingleton<VerificationRepository>(
      () => VerificationRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<VerificationRemoteDataSource>(
      () => FirebaseVerificationDataSource());

  locator.registerLazySingleton(() => UserBloc(
        signOutUser: locator(),
        getUserInfo: locator(),
        userInfoChange: locator(),
      ));
  locator.registerLazySingleton(() => SignOutUser(repository: locator()));
  locator.registerLazySingleton(() => GetUserInfo(repository: locator()));
  locator.registerLazySingleton(() => UserInfoChange(repository: locator()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<UserRemoteDataSource>(
      () => FirebaseUserDataSource());
  //ORDER BLOC
  locator.registerLazySingleton(() => OrderBloc(
        sendOrder: locator(),
      ));
  locator.registerLazySingleton(() => SendOrder(
        repository: locator(),
      ));
  locator.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl(
        networkInfo: locator(),
        remoteDataSource: locator(),
      ));

  locator.registerLazySingleton<OrdersRemoteDataSource>(() => isSbis
      ? SbisOrdersDataSource(cookiesController: locator())
      : OldApiOrdersDataSource());
  //DISHCONFIG BLOC
  locator.registerLazySingleton(() => DishConfigBloc());
  //Gifts BLoC
  /*locator.registerLazySingleton(() => GiftsBloc(
        getAvailableGifts: locator(),
        useGift: locator(),
      ));
  locator.registerLazySingleton(() => GetAvailableGifts(repository: locator()));
  locator.registerLazySingleton(() => UseGift(repository: locator()));

  locator.registerLazySingleton<GiftsRepository>(() => GiftsRepositoryImpl(
        networkInfo: locator(),
        remoteDataSource: locator(),
      ));*/

  // locator.registerLazySingleton<GiftsRemoteDataSource>(
  //    () => FirestoreGiftsDataSource());
  //AddressSuggestions BLoC
  locator.registerLazySingleton(() =>
      SuggestionsBloc(getStreets: locator(), getCitySuggestions: locator()));
  locator.registerLazySingleton(() => GetStreets(repository: locator()));

  locator
      .registerLazySingleton(() => GetCitySuggestions(repository: locator()));
  locator.registerLazySingleton<SuggestionsRepository>(
      () => SuggestionsRepositoryImpl(
            networkInfo: locator(),
            remoteDataSource: locator(),
          ));
  locator.registerLazySingleton<SuggestionsRemoteDataSource>(() => isSbis
      ? SbisSuggestionsSource(cookiesController: locator())
      : IikoSuggestionsSource());
  //Promocodes BLoC
  /*
  locator
      .registerLazySingleton(() => PromocodesBloc(checkPromocode: locator()));
  locator.registerLazySingleton(() => CheckPromocode(
      repository: PromocodeRepositoryImpl(
          networkInfo: locator(), remoteDataSource: locator())));
  locator.registerLazySingleton<PromocodeRemoteDataSource>(
      () => NewApiPromocodeDataSource());*/
  //Cart BLoC
  locator.registerLazySingleton(() => CartBloc(initialCart: {}));

  //Dishes BLoC
  locator
      .registerLazySingleton<DishesBloc>(() => DishesBloc(getMenu: locator()));
  locator.registerLazySingleton(() => GetMenu(repository: locator()));
  locator.registerLazySingleton<DishesRepository>(() => DishesRepositoryImpl(
      networkInfo: locator(),
      remoteDataSource: locator(),
      localDataSource: locator()));
  locator.registerLazySingleton<DishesRemoteDataSource>(() => isSbis
      ? SbisDishesDataSource(cookiesController: locator())
      : NewApiDishesDataSource());
  // locator.registerLazySingleton<DishesRemoteDataSource>(
  //     () => SbisDishesDataSource(cookiesController: locator()));
  locator.registerLazySingleton<DishesLocalDataSource>(
      () => DishesLocalDataSourceImpl());

  //NetworkInfo
  /* locator.registerLazySingleton<NetworkInfo>(() => NewApiNetworkInfo());*/
  locator.registerLazySingleton<NetworkInfo>(() => isSbis
      ? SbisNetworkInfo(cookiesController: locator())
      : NewApiNetworkInfo());
}
