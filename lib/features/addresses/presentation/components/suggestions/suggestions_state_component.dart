import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';

import '../../../../../locator.dart';

@Component(
  selector: 'suggestions_state_component',
  templateUrl: 'suggestions_state_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialAutoSuggestInputComponent,
    PopupSourceDirective,
    coreDirectives,
  ],
)
class SuggestionsStateComponent implements AfterChanges {
  @Input()
  SuggestionsState state;

  bool visible = true;

  bool get isLoaded => state is LoadedSuggestionsState;
  String get vals => values.join(', ');
  final List<String> values = [];
  void inputChanged(String text) {
    locator<SuggestionsBloc>().add(
      GetStreetsSuggestionsEvent(
        city: City(
            city: 'Краснодарский край, г. Новороссийск', cityId: '23000006000'),
        query: text,
      ),
    );
  }

  @override
  void ngAfterChanges() {
    values.clear();
    if (isLoaded) {
      values.addAll((state as LoadedSuggestionsState)
          .streetSuggestions
          .map((e) => e.street));
          visible = true;
    }
  }
}
