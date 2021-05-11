import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dojo_test_app/exercise_db.dart';

class DojoGame extends StatefulWidget {
  final ExerciseDb exercises;
  const DojoGame({Key key, this.exercises}) : super(key: key);

  @override
  // _DojoGameState createState() =>
  //     _DojoGameState(exerciseData: this.exerciseData);
  _DojoGameState createState() => _DojoGameState();
}

class _DojoGameState extends State<DojoGame> {
  // List<Exercise> exerciseData;
  // _DojoGameState({this.exerciseData});

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
            Text(widget.exercises.getReps().toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                )),
            Text(widget.exercises.getExerciseName(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                )),
            SizedBox(height: 15),
            (_counter > 0)
                ? Text("")
                : Text(
                    "DONE!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
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
                  widget.exercises.nextExercise();
                  widget.exercises.repCount();
                  widget.exercises.roundCount();
                  print(widget.exercises.getTotalRounds().toString());
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
                Text(
                    'Total Reps:  ' +
                        widget.exercises.getTotalReps().toString(),
                    style: TextStyle(fontSize: 30)),
                Text(
                  'Total Rounds:  ' +
                      widget.exercises.getTotalRounds().toString(),
                  style: TextStyle(fontSize: 30),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.exercises.reset();
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text('Reset Workout')),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
