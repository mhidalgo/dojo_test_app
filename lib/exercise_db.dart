import 'exercise.dart';

class ExerciseDb {
  ExerciseDb({this.workout});

  int _exerciseRound = 0; //scroll through exercise list
  int _actualExerciseRound = 0; //actual rounds of exercises
  int _repsCount = 0; //total number of reps
  int _rounds = 0; //total number of rounds

  // List<Exercise> workout = [
  //   Exercise(name: 'Push-ups', reps: 10),
  //   Exercise(name: 'Sit-ups', reps: 20),
  //   Exercise(name: 'Squats', reps: 30)
  // ];

  List<Exercise> workout = [];

  void nextExercise() {
    _actualExerciseRound++;

    if (_exerciseRound < workout.length - 1) {
      _exerciseRound++;
    } else if (_exerciseRound == 2) {
      _exerciseRound = 0;
    }
  }

  String getExerciseName() {
    return workout[_exerciseRound].name;
  }

  int getReps() {
    return workout[_exerciseRound].reps;
  }

  void repCount() {
    _repsCount = _repsCount + workout[_exerciseRound].reps;
  }

  void roundCount() {
    _rounds = (_actualExerciseRound / 3).floor();
  }

  int getTotalReps() {
    return _repsCount;
  }

  int getTotalRounds() {
    return _rounds;
  }

  void reset() {
    _exerciseRound = 0; //scroll through exercise list
    _actualExerciseRound = 0; //actual rounds of exercises
    _repsCount = 0; //total number of reps
    _rounds = 0; //total number of rounds
  }
}
