import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_web/features/core/presentation/components/info_state_component.dart';
import 'package:edakratiya_web/locator.dart';

@Component(
    selector: 'info_bloc_component',
    templateUrl: 'info_bloc_component.html',
    directives: [InfoStateComponent],
    pipes: [BlocPipe])
class InfoBlocComponent {
  GlobalSettingsBloc get globalSettingsBloc => locator<GlobalSettingsBloc>();
}
