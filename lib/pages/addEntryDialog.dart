import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weightSave.dart';
import 'dart:math';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {

  void _saveButtonClk () {
    Navigator.of(context).pop(new WeightSave(new DateTime.now(), new Random().nextInt(100).toDouble()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: new AppBar(
      title: const Text('New entry'),
      actions: [
        new FlatButton(
            onPressed: _saveButtonClk,
            child: new Text('Save',
                style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white))),
      ],
    ),
    body: new Text("Foo"),
  );
}
