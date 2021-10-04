import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/cookies/cookies_controller.dart';
import 'package:edakratiya_web/features/dishconfig/presentation/components/required_additions_components.dart';
import 'package:edakratiya_web/features/dishconfig/presentation/components/size_config_component.dart';
import 'package:edakratiya_web/locator.dart';

@Component(
  selector: 'modal_dish_component',
  templateUrl: 'modal_dish_component.html',
  directives: [
    MaterialDialogComponent,
    RequiredAdditionsComponent,
    AutoDismissDirective,
    AutoFocusDirective,
    MaterialIconComponent,
    MaterialButtonComponent,
    SizeConfigComponent,
    NgIf,
  ],
)
class ModalDishComponent implements OnInit {
  @Input()
  DishGroup group;
  Map<String, String> authHeaders;
  String get imageLink => (cartDish?.photo != null)
      ? ((cartDish.photo.contains('/img?'))
          ? '${cartDish.photo}&sid=${authHeaders['X-SBISSessionId']}&token=${authHeaders['X-SBISAccessToken']}'
          : cartDish.photo)
      : 'https://devapi.edakratiya.com/media/products_photo/66142320-7d8e-45d8-9234-1febc539df9d.jpg';
  @Input()
  set cartDish(CartDish cartDish) {
    if (_cartDish?.id != cartDish?.id) {
      _count = 1;
    }
    _cartDish = cartDish;
  }

  CartDish get cartDish => _cartDish;
  CartDish _cartDish;

  List<int> get sizes =>
      group?.products?.map((e) => e.size)?.where((e) => e != null)?.toList();
  List<String> get requiredAdditions => group?.requiredAdditions;

  bool get hasRequiredAdditions => (requiredAdditions?.length ?? 0) > 1;

  bool get hasSizes => (sizes?.length ?? 0) > 1;

  String get title => group?.title;

  String get description => group?.description;

  String get productsString =>
      group?.composition?.map((e) => e.name)?.join(', ');

  int _count = 1;

  int get count => _count;

  void addCount() => _count += 1;

  void minusCount() => (_count > 1) ? _count -= 1 : _count = 1;

  String get measure => '${_cartDish?.measure} ${_cartDish?.measureUnit}';

  int get price =>
      (_count * (_cartDish?.newPrice ?? _cartDish?.price ?? 1)).round();
  void addToCart() {
    locator<CartBloc>().add(AddDishEvent(dish: cartDish, count: count));
    locator<DishConfigBloc>().add(DishConfigClearEvent());
  }

  void close() {
    locator<DishConfigBloc>().add(DishConfigClearEvent());
  }

  @override
  Future<void> ngOnInit() async {
    authHeaders = await locator<ApiTokensController>().getAuthHeaders();
  }
}
