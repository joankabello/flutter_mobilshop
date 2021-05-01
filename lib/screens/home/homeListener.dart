import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeState.dart';
import 'package:flutter_mobilshop/screens/home/widgets/homeBuilder.dart';
import 'package:flutter_mobilshop/widgets/snackBarWidget.dart';

Widget homeListener() {
  return MultiBlocListener(
    listeners: [
      BlocListener<HomeBloc, HomeState>(
        listener: (context, state) async {
          if (state is HomeLoadedFailure) {
            return snackBarWidget(context, state.error, Colors.red);
          }
        },
      ),
    ],
    child: BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeBuilderState,
      builder: (context, state) {
        return HomeBuilder();
      },
    ),
  );
}
