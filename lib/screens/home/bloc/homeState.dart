import 'package:equatable/equatable.dart';
import 'package:flutter_mobilshop/models/shop.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeBuilderState extends HomeState {}

class HomeInitialState extends HomeBuilderState {}

class HomeLoaded extends HomeBuilderState {
  final List<ShopItem> shopItemList;

  HomeLoaded(this.shopItemList);

  @override
  List<Object> get props => [shopItemList];
}

class HomeLoadedFailure extends HomeState {
  final String error;

  HomeLoadedFailure(this.error);

  @override
  List<Object> get props => [error];
}