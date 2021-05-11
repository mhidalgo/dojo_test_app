import 'package:dojo_test_app/screens/dojo_game.dart';
import 'package:flutter/material.dart';
import 'package:dojo_test_app/exercise.dart';
import 'package:dojo_test_app/exercise_db.dart';

class DojoSetup extends StatefulWidget {
  @override
  _DojoSetupState createState() => _DojoSetupState();
}

class _DojoSetupState extends State<DojoSetup> {
  String name1;
  String name2;
  String name3;
  int reps1 = 0;
  int reps2 = 0;
  int reps3 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        title: Text('Dojo'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Text(
                'Define your workout',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Text(
                'Exercise Block 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter Exercise',
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  name1 = value;
                  print(name1);
                },
              ),
            ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Reps',
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    reps1 = int.tryParse(value);
                    print(reps1);
                  }),
            ),
            Expanded(
              child: Text(
                'Exercise Block 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter Exercise',
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  name2 = value;
                  print(value);
                },
              ),
            ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Reps',
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    reps2 = int.tryParse(value);
                    print(reps2);
                  }),
            ),
            Expanded(
              child: Text(
                'Exercise Block 3',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Enter Exercise',
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  name3 = value;
                  print(name3);
                },
              ),
            ),
            Expanded(
              child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Enter Reps',
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    reps3 = int.tryParse(value);
                    print(reps3);
                  }),
            ),
            GestureDetector(
              onTap: () {
                Exercise exercise1 = Exercise(name: name1, reps: reps1);
                Exercise exercise2 = Exercise(name: name2, reps: reps2);
                Exercise exercise3 = Exercise(name: name3, reps: reps3);

                List<Exercise> exercises = [exercise1, exercise2, exercise3];

                ExerciseDb exerciseDB = ExerciseDb(workout: exercises);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return DojoGame(exercises: exerciseDB);
                  }),
                );
                print(exercises[0].name);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Start',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                color: Colors.black,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.only(bottom: 20.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
