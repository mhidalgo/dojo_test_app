import 'dart:async';
import 'package:flutter/material.dart';
import 'exercise_db.dart';

ExerciseDb exerciseDb = ExerciseDb();

void main() {
  runApp(DojoApp());
}

class DojoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DojoHome(),
    );
  }
}

class DojoHome extends StatefulWidget {
  @override
  _DojoHomeState createState() => _DojoHomeState();
}

class _DojoHomeState extends State<DojoHome> {
  int _counter = 20;
  Timer _timer;

  void _startTimer() {
    _counter = 20;
    int minutes = (_counter / 60).floor();
    print(_counter);
    print(minutes);

    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = (_counter / 60).floor();
    int seconds = _counter.remainder(60);
    String time_1 = '';

    if (seconds < 10) {
      time_1 = '$minutes:0$seconds';
    } else {
      time_1 = '$minutes:$seconds';
    }

    return Scaffold(
      backgroundColor: Colors.red[700],
      appBar: AppBar(
        title: Text('Dojo'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Next Exercise',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Text(exerciseDb.getReps().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                )),
            Text(exerciseDb.getExerciseName(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                )),
            SizedBox(height: 20),
            (_counter > 0)
                ? Text("")
                : Text(
                    "DONE!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
            Text(
              '$time_1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
              ),
            ),
            ElevatedButton(
              onPressed: () => _startTimer(),
              child: Text("Start Workout"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  exerciseDb.nextExercise();
                  exerciseDb.repCount();
                  exerciseDb.roundCount();
                  print(exerciseDb.getTotalRounds().toString());
                });
              },
              child: Text('Finished Reps'),
            ),
            SizedBox(height: 20),
            Container(
              color: Colors.amber[600],
              width: 300,
              height: 300,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Scores',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
                Text('Total Reps:  ' + exerciseDb.getTotalReps().toString(),
                    style: TextStyle(fontSize: 30)),
                Text(
                  'Total Rounds:  ' + exerciseDb.getTotalRounds().toString(),
                  style: TextStyle(fontSize: 30),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
