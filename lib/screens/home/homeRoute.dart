import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';
import 'package:flutter_mobilshop/screens/home/homeScreen.dart';
import 'package:flutter_mobilshop/services/shopService.dart';

class HomeRoute {
  static const String name = "/home";

  static MultiRepositoryProvider get provider => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (BuildContext context) => ShopService(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(
                RepositoryProvider.of<ShopService>(context),
              )..add(OnHomeLoaded()),
            ),
          ],
          child: HomeScreen(),
        ),
      );
}
