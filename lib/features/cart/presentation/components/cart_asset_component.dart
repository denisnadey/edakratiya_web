import 'package:angular/angular.dart';

@Component(
  selector: 'cart_asset_component',
  templateUrl: 'cart_asset_component.html',
  directives: [coreDirectives],
)
class CartAssetComponent {
  @Input()
  int count;

  void minus() {
    if (count < 1) {
      count = 0;
    } else {
      count--;
    }
  }

  void plus() {
    count++;
  }
}
