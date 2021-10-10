import 'package:flutter/material.dart';

class cardChild extends StatelessWidget {

  cardChild({this.cardIcon, this.cardText});

  final Icon cardIcon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cardIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(cardText,style: TextStyle(
            fontSize: 15.0,color: Color(0xFF8D8E98)
        ),
        ),
      ],
    );
  }

}