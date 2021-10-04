import 'dart:js' as js;

import 'package:angular/angular.dart';

@Component(
  selector: 'slider_component',
  templateUrl: 'slider_component.html',
  directives: [
    coreDirectives,
  ],
)
class SliderComponent implements AfterViewInit {
  @override
  void ngAfterViewInit() {
    js.context.callMethod('slider');
  }
}