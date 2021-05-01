import 'package:equatable/equatable.dart';
import 'package:flutter_mobilshop/models/shop.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeEvent {}

class OnHomeLoaded extends HomeEvent {}

class OnAddItem extends HomeEvent {
  final String itemName;

  OnAddItem(this.itemName);

  @override
  List<Object> get props => [itemName];
}

class OnDeleteItem extends HomeEvent {
  final ShopItem shopItem;

  OnDeleteItem(this.shopItem);

  @override
  List<Object> get props => [shopItem];
}

class OnUpdateShopItem extends HomeEvent {
  final ShopItem shopItem;

  OnUpdateShopItem(this.shopItem);

  @override
  List<Object> get props => [shopItem];
}