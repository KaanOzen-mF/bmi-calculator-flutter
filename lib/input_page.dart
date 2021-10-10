import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'cardChild.dart';
import 'constants.dart';
import 'roundIconButton.dart';
import 'resultPage.dart';
import 'bottomButton.dart';
import 'calculatorBrain.dart';

enum Gender{
  female,
  male
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress:(){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    widgetCardColour: selectedGender == Gender.male ? kActivieColour : kInactivieColour,
                    cardChild: cardChild(
                      cardIcon: Icon(FontAwesomeIcons.mars,size: 80.0),
                      cardText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    widgetCardColour: selectedGender == Gender.female ? kActivieColour : kInactivieColour,
                    cardChild: cardChild(
                      cardIcon: Icon(FontAwesomeIcons.venus,size: 80.0,),
                      cardText: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                widgetCardColour: kWidgetCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",style: kTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(height.toString(),style: kTextLabel,),
                        Text("cm",style: kTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kInactiveTrackColour,
                        activeTrackColor: Colors.white,
                        thumbColor: kThumbColour,
                        overlayColor: kOverlayColour,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                          }
                      ),
                    )
                  ],
                ),
              ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    widgetCardColour: kWidgetCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",style: kTextStyle),
                        Text(weight.toString(),style: kTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed:(){
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    widgetCardColour: kWidgetCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",style: kTextStyle),
                        Text(age.toString(),style: kTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(width: 10.0),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                              setState(() {
                                age++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmi: calc.calculateBMI(),
              resultText: calc.getResults(),
              interpretationText: calc.getInterpretation(),
            ),));
          },
          buttonTitle: "CALCULATE",
          )
        ],
      ),
    );
  }
}





