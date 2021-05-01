import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeBuilderState extends HomeState {}

class HomeInitialState extends HomeBuilderState {}

class HomeLoaded extends HomeBuilderState {}

class HomeLoadedFailure extends HomeState {
  final String error;

  HomeLoadedFailure(this.error);

  @override
  List<Object> get props => [error];
}