import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeBloc.dart';
import 'package:flutter_mobilshop/screens/home/bloc/homeEvents.dart';
import 'package:flutter_mobilshop/screens/home/homeListener.dart';
import 'package:flutter_mobilshop/widgets/textAlertDialog.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
          onPressed: () {
            textAlertDialog(
              context: context,
              title: "Add item name",
              descriptionController: descriptionController,
              actions: [
                TextButton(
                  onPressed: () {
                    BlocProvider.of<HomeBloc>(context).add(
                      OnAddItem(descriptionController.text),
                    );
                    Navigator.pop(context);
                  },
                  child: Text("Confirm"),
                )
              ],
            );
          },
          icon: Icon(Icons.add),
          label: Text("Add item"),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: homeListener(),
      ),
    );
  }
}
