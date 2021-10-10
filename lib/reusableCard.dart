import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  ReusableCard({this.cardChild,this.widgetCardColour,this.onPress});
  final Widget cardChild;
  final Color widgetCardColour;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widgetCardColour,
        ),
      ),
    );
  }


}