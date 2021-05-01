import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is OnHomeLoaded) {
      yield* _mapHomeLoadedToState(event);
    }
  }

  Stream<HomeState> _mapHomeLoadedToState(OnHomeLoaded event) async* {}
}
