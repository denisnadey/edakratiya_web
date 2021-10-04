import 'package:angular/angular.dart';
import 'package:edakratiya_core/edakratiya_core.dart';
import 'package:edakratiya_core/features/cookies/cookies_controller.dart';
import 'package:edakratiya_web/locator.dart';

@Component(
  selector: 'dish_card',
  templateUrl: 'dish_card_component.html',
  directives: [
    coreDirectives,
  ],
)
class DishCardComponent implements OnInit {
  @Input()
  DishGroup group;
  Map<String, String> authHeaders;
  void openModal() {
    locator<DishConfigBloc>().add(DishConfigGroupSelected(dishGroup: group));
  }

  int get price {
    final listOfPrices =
        group.products.map((e) => e.newPrice ?? e.price).toList();
    listOfPrices.sort();
    return listOfPrices.first;
  }

  String get description => (group?.description?.isNotEmpty ?? false)
      ? group?.description
      : _productsString.capitalized;

  String get _productsString =>
      group?.composition?.map((e) => e.name)?.join(', ');

  bool get isNotSinglePrice =>
      group.products.map((e) => e.price).toSet().length > 1;

  bool get hasSizes => group.products
      .map((e) => e.size != null)
      .where((element) => element != false)
      .isNotEmpty;

  String get sizes => hasSizes
      ? group.products.map((e) => e.size).where((e) => e != null).join('/')
      : null;

  String get image => ((group.imageLinks?.isNotEmpty ?? false) &&
          authHeaders != null)
      ? ((group.imageLinks.first.contains('/img?'))
          ? '${group.imageLinks.first}&sid=${authHeaders['X-SBISSessionId']}&token=${authHeaders['X-SBISAccessToken']}'
          : group.imageLinks.first)
      : 'https://devapi.edakratiya.com/media/products_photo/9ff82459-f04e-4457-92b0-79309fceefe6.jpg';

  @override
  Future<void> ngOnInit() async {
    authHeaders = await locator<ApiTokensController>().getAuthHeaders();
  }
}

extension StringExtension on String {
  String get capitalized {
    if (this == null) {
      return null;
    }
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}
