import 'package:flutter/material.dart';
import 'dart:math';
import 'package:weight_tracker/models/weightSave.dart';
import 'package:weight_tracker/components/weightListItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightSave> _weightSaves = [];

  void _addWeight () {
    setState(() {
      _weightSaves.add(WeightSave(new DateTime.now(), new Random().nextInt(100).toDouble()));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weiget Tracker'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _weightSaves.length,
        itemBuilder: (context, indice) {
          bool isFirstWeight = indice == 0;
          WeightSave weightSave = _weightSaves[indice];
          double difference = isFirstWeight ? 0.0 : weightSave.weight - _weightSaves[indice - 1].weight;

          return WeightListItem(weightSave, difference);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWeight,
        child: Icon(Icons.add),
      ),
    );
  }
}
