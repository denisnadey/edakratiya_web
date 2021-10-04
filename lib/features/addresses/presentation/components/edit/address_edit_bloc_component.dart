import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/addresses/presentation/components/edit/address_edit_state_component.dart';

import '../../../../../locator.dart';

@Component(
    selector: 'address_edit_bloc_component',
    templateUrl: 'address_edit_bloc_component.html',
    pipes: [
      BlocPipe,
    ],
    directives: [
      AddressEditStateComponent,
    ])
class AddressEditBlocComponent {
  @Input()
  bool isEditing;

  AddressBloc get addressBloc => locator<AddressBloc>();
}
