import 'package:flutter/material.dart';
import 'package:dojo_test_app/exercise_db.dart';
import 'package:dojo_test_app/exercise.dart';

class TestData extends StatelessWidget {
  TestData({this.exercises});

  final List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('test'), backgroundColor: Colors.blueGrey[900]),
      body: Center(
        child: Container(child: Text(exercises[0].name)),
      ),
    );
  }
}
