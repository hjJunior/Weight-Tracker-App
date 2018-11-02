import 'package:flutter/material.dart';
import 'package:weight_tracker/models/weightSave.dart';
import 'package:weight_tracker/components/dateTimeItem.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:math';

class AddEntryDialog extends StatefulWidget {
  @override
  AddEntryDialogState createState() => new AddEntryDialogState();
}

class AddEntryDialogState extends State<AddEntryDialog> {
  TextEditingController _textEditingController = TextEditingController();
  double _weight = 1.0;
  DateTime _dateTime = new DateTime.now();
  String _note;

  void _saveButtonClk () {
    Navigator.of(context).pop(WeightSave(_dateTime, _weight, _note));
  }

  void _showWeightPicker(BuildContext context) {
    showDialog(
      context: context,
      child: NumberPickerDialog.decimal(
        minValue: 1,
        maxValue: 150,
        initialDoubleValue: _weight,
        title: new Text("Enter your weight"),
      )
    ).then((value) {
      if (value != null) {
        setState(() => _weight = value);
      }
    });
  }

  @override
  void initState() {
    _textEditingController = new TextEditingController(text: _note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: new AppBar(
      title: const Text('New entry'),
      actions: [
        new FlatButton(
            onPressed: _saveButtonClk,
            child: new Text('Save', style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white))),
      ],
    ),
    body: Column(
      children: <Widget>[
        new ListTile(
          leading: new Icon(Icons.today, color: Colors.grey[500]),
          title: new DateTimeItem(
            dateTime: _dateTime,
            onChanged: (dateTime) => setState(() => _dateTime = dateTime),
          ),
        ),
        new ListTile(
          leading: Icon(Icons.airplay),
          title: new Text(
            "$_weight kg",
          ),
          onTap: () => _showWeightPicker(context),
        ),
        new ListTile(
          leading: new Icon(Icons.speaker_notes, color: Colors.grey[500]),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: 'Optional note',
            ),
            controller: _textEditingController,
            onChanged: (value) => _note = value,
          ),
        ),
      ],
    ),
  );
}
