import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../locator.dart';

@Component(
    selector: 'global_settings_bloc_component',
    templateUrl: 'global_settings_bloc_component.html',
    pipes: [BlocPipe])
class GlobalSettingsInfoComponent {
  GlobalSettingsBloc get globalSettingsBloc => locator<GlobalSettingsBloc>();
}
