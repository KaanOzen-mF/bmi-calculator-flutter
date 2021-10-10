import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({this.height, this.weight});

  final int weight;
  final int height;
  double _bmi;

  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResults(){
    if(_bmi >= 25){
      return "Overweight";
    }else if(_bmi > 18.5){
      return "Normal";
    }else{
      return "Underweight";
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return "You have a higher than normal weight.You should do exercise";
    }else if(_bmi > 18.5){
      return "You have a normal body weight.Good job!";
    }else{
      return "You have a lower than normal weight.You can eat a bit more.";
    }
  }

}



