import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/global_settings/domain/entities/global_settings.dart';
import 'package:edakratiya_web/features/core/presentation/components/info_component.dart';

@Component(
    selector: 'info_state_component',
    templateUrl: 'info_state_component.html',
    directives: [coreDirectives, InfoComponent])
class InfoStateComponent {
  @Input()
  GlobalSettingsState state;
  bool get isLoading => state is GlobalSettingsInitial;
  bool get isLoaded => state is GlobalSettingsLoaded;
  GlobalSettings get settings =>
      isLoaded ? (state as GlobalSettingsLoaded).settings : null;
}
