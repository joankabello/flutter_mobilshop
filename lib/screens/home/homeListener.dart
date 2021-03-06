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
          if (state is ItemAddedSuccess) {
            return snackBarWidget(context, state.successMessage, Colors.green);
          }
          if (state is ShopItemDeletedSuccess) {
            return snackBarWidget(context, state.successMessage, Colors.green);
          }
        },
      ),
    ],
    child: BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeBuilderState,
      builder: (context, state) {
        if (state is HomeLoaded) {
          return HomeBuilder(shopItemList: state.shopItemList);
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
  );
}
