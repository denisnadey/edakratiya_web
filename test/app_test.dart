@TestOn('browser')

import 'package:edakratiya_web/app_component.template.dart' as ng;
import 'package:angular_test/angular_test.dart';
import 'package:test/test.dart';

void main() {
  ng.initReflector();
  tearDown(disposeAnyRunningTest);
}
