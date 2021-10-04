import 'package:angular/angular.dart';
import 'package:edakratiya_core/features/global_settings/domain/entities/global_settings.dart';
import 'package:intl/intl.dart';
//import 'package:edakratiya_core/edakratiya_core.dart';

@Component(
  selector: 'info_component',
  templateUrl: 'info_component.html',
  directives: [
    coreDirectives,
  ],
)
class InfoComponent {
  @Input()
  GlobalSettings globalSettings;
  String get timeFrom => DateFormat('HH.mm').format(globalSettings.fromTime);
  String get timeTo => DateFormat('HH.mm').format(globalSettings.toTime);
  String get phoneNumberLink => 'tel:${globalSettings.phoneNumber}';
}
