import 'exercise.dart';

class ExerciseDb {
  int _exerciseRound = 0; //scroll through exercise list
  int _actualExerciseRound = 0; //actual rounds of exercises
  int _repsCount = 0; //total number of reps
  int _rounds = 0; //total number of rounds

  List<Exercise> _workout = [
    Exercise('Push-ups', 10),
    Exercise('Sit-ups', 20),
    Exercise('Squats', 30)
  ];

  void nextExercise() {
    _actualExerciseRound++;

    if (_exerciseRound < _workout.length - 1) {
      _exerciseRound++;
    } else if (_exerciseRound == 2) {
      _exerciseRound = 0;
    }
  }

  String getExerciseName() {
    return _workout[_exerciseRound].name;
  }

  int getReps() {
    return _workout[_exerciseRound].reps;
  }

  void repCount() {
    _repsCount = _repsCount + _workout[_exerciseRound].reps;
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
