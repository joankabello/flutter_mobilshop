import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_mobilshop/models/shop.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeState.dart';
import 'package:flutter_mobilshop/services/shopService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockShopService extends Mock implements ShopService {}

void main() async {
  MockShopService shopService;
  HomeBloc homeBloc;

  List<ShopItem> shopItemList = [
    ShopItem(id: "123", name: "test", isChecked: false)
  ];

  ShopItem shopItem = ShopItem(
    id: "123",
    name: "test",
    isChecked: false,
  );

  setUp(() {
    shopService = MockShopService();
    homeBloc = HomeBloc(shopService);
  });

  tearDown(() {
    homeBloc.close();
  });

  group("HomeBloc Shop Services success test group", () {
    blocTest(
      "emits [HomeLoaded] state when getting items from firebase",
      build: () {
        when(
          shopService.getShopItems(),
        ).thenAnswer((_) async => Future.value(shopItemList));
        return homeBloc;
      },
      act: (bloc) => bloc.add(OnHomeLoaded()),
      expect: () => [
        HomeLoaded(shopItemList),
      ],
    );

    blocTest(
      "emits [ItemAddedSuccess] state when adding an item on the shop list",
      build: () {
        when(
          shopService.addShopItem("Flowers"),
        ).thenAnswer((_) async => null);
        when(
          shopService.getShopItems(),
        ).thenAnswer((_) async => Future.value(shopItemList));
        return homeBloc;
      },
      act: (bloc) => bloc.add(OnAddItem("Flowers")),
      expect: () => [
        ItemAddedSuccess("Item added successfully"),
        HomeLoaded(shopItemList),
      ],
    );

    blocTest(
      "emits [ShopItemDeletedSuccess] state when deleting an item on the shop list",
      build: () {
        when(
          shopService.deleteShopItem(shopItem),
        ).thenAnswer((_) async => null);
        when(
          shopService.getShopItems(),
        ).thenAnswer((_) async => Future.value(shopItemList));
        return homeBloc;
      },
      act: (bloc) => bloc.add(OnDeleteItem(shopItem)),
      expect: () => [
        ShopItemDeletedSuccess("Shop Item deleted successfully"),
        HomeLoaded(shopItemList),
      ],
    );

    blocTest(
      "emits [UpdateShopItem] state when checking an item on the shop list",
      build: () {
        when(
          shopService.updateShopItem(shopItem),
        );
        return homeBloc;
      },
      act: (bloc) => bloc.add(OnUpdateShopItem(shopItem)),
      expect: () => [
        ItemUpdatedSuccess(),
      ],
    );
  });

   group("HomeBloc EShop Services error test group", () {
    blocTest(
      "emits [HomeLoadedFailure] state when adding an empty item name",
      build: () => homeBloc,
      act: (bloc) => bloc.add(OnAddItem("")),
      expect: () => [
        HomeLoadedFailure("Item name can't be empty"),
      ],
    );
  });
}
