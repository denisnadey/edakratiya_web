import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/addresses/presentation/components/list/address_list_state_component.dart';

import '../../../../../locator.dart';

@Component(
    selector: 'address_list_bloc_component',
    templateUrl: 'address_list_bloc_component.html',
    pipes: [
      BlocPipe
    ],
    directives: [
      AddressListStateComponent,
    ])
class AddressListBlocComponent {
  @Input()
  bool isEditing;
  AddressListBloc get addressListBloc => locator<AddressListBloc>();
}
