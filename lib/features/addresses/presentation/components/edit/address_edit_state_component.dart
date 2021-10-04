import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/addresses/presentation/components/suggestions/suggestions_state_component.dart';

import '../../../../../locator.dart';

@Component(
  selector: 'address_edit_state_component',
  templateUrl: 'address_edit_state_component.html',
  pipes: [
    BlocPipe,
  ],
  directives: [
    coreDirectives,
    SuggestionsStateComponent,
  ],
)
class AddressEditStateComponent {
  @Input()
  AddressState state;
  SuggestionsBloc get suggestionsBloc => locator<SuggestionsBloc>();
}
