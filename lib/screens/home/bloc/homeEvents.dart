import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeEvent {}

class OnHomeLoaded extends HomeEvent {}