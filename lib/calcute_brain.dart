import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String Calculatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getInterolation() {
    if (_bmi >= 25.0) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'You have higher than normal weight.Try to exercise more!!!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.Good job!!!';
    } else {
      return 'You have lower than normal body weight.You can eat a bit more!!!';
    }
  }

}