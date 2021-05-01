import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/homeScreen.dart';

class HomeRoute {
  static const String name = "/home";

  static MultiBlocProvider get provider => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
        ],
        child: HomeScreen(),
      );
}
