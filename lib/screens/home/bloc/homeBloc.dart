import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeState.dart';
import 'package:flutter_mobilshop/services/shopService.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShopService _shopService;

  HomeBloc(ShopService shopService)
      : assert(shopService != null),
        _shopService = shopService,
        super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeLoaded) {
      yield* _mapHomeLoadedToState(event);
    }
    if (event is OnAddItem) {
      yield* _mapAddItem(event);
    }
    if (event is OnDeleteItem) {
      yield* _mapDeleteItem(event);
    }
    if (event is OnUpdateShopItem) {
      yield* _mapUpdateShopItem(event);
    }
  }

  Stream<HomeState> _mapHomeLoadedToState(OnHomeLoaded event) async* {
    
    final shopItemList = await _shopService.getShopItems();

    yield HomeLoaded(shopItemList);
  }

  Stream<HomeState> _mapAddItem(OnAddItem event) async* {
    if (event.itemName.isNotEmpty) {
      await _shopService.addShopItem(event.itemName);
      yield ItemAddedSuccess("Item added successfully");
      add(OnHomeLoaded());
    }
    else {
      yield HomeLoadedFailure("Item name can't be empty");
    }
  }

  Stream<HomeState> _mapDeleteItem(OnDeleteItem event) async* {
    await _shopService.deleteShopItem(event.shopItem);
    yield ShopItemDeletedSuccess("Shop Item deleted successfully");
    add(OnHomeLoaded());
  }

  Stream<HomeState> _mapUpdateShopItem(OnUpdateShopItem event) async* {
    await _shopService.updateShopItem(event.shopItem);
    yield ItemUpdatedSuccess();
  }
}
