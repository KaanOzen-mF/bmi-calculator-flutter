import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';
import 'bottomButton.dart';
import 'calculatorBrain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmi,@required this.resultText,@required this.interpretationText});

  final String bmi;
  final String resultText;
  final String interpretationText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                    "Your Result",style: kTitleTextStyle,),
              )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              widgetCardColour: kActivieColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,style: kResultTextStyle),
                  Text(bmi,style: kBMITextStyle,),
                  Text(interpretationText,style: kResultPageTextStyle,textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          },buttonTitle: "RECALCULATE")
        ],
      ),
    );
  }
}
