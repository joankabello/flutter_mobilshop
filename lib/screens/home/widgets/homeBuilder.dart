import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/models/shop.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';

class HomeBuilder extends StatefulWidget {
  final List<ShopItem> shopItemList;

  const HomeBuilder({this.shopItemList});

  @override
  _HomeStateBuilder createState() => _HomeStateBuilder();
}

class _HomeStateBuilder extends State<HomeBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.shopItemList.isEmpty) {
      return Center(
        child: Text("Shopping List is empty!"),
      );
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: widget.shopItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.lightBlue[50],
            leading: Checkbox(
              value: widget.shopItemList[index].isChecked,
              onChanged: (value) {
                setState(() {
                  widget.shopItemList[index].isChecked = value;
                });
                BlocProvider.of<HomeBloc>(context).add(
                  OnUpdateShopItem(widget.shopItemList[index]),
                );
              },
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(
                  OnDeleteItem(widget.shopItemList[index]),
                );
              },
            ),
            title: Text(
              widget.shopItemList[index].name,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
